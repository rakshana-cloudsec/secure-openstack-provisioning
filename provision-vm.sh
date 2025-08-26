#!/bin/bash
# ------------------------------------------------------------
# Secure OpenStack VM Provisioning Script
# Author: Rakshana Kannaya Muralidharan
# Description: Automates VM provisioning with security defaults,
#              RBAC enforcement, and secure networking.
# ------------------------------------------------------------

# ========== CONFIG ==========
IMAGE="ubuntu-20.04"                # Base image
FLAVOR="m1.small"                   # VM size
NETWORK="private-net"               # Target network
KEYPAIR="default-key"               # SSH keypair name
SEC_GROUP="secure-sg"               # Security group name
VM_NAME="secure-vm-$(date +%s)"     # Unique VM name

# ========== FUNCTIONS ==========

create_security_group() {
    echo "[INFO] Checking for existing security group..."
    if ! openstack security group list | grep -q "$SEC_GROUP"; then
        echo "[INFO] Creating security group: $SEC_GROUP"
        openstack security group create "$SEC_GROUP" --description "Secure default rules"
        
        echo "[INFO] Adding rules: SSH(22), HTTPS(443)"
        openstack security group rule create --proto tcp --dst-port 22 "$SEC_GROUP"
        openstack security group rule create --proto tcp --dst-port 443 "$SEC_GROUP"
    else
        echo "[INFO] Security group $SEC_GROUP already exists."
    fi
}

provision_vm() {
    echo "[INFO] Provisioning VM: $VM_NAME ..."
    openstack server create \
        --image "$IMAGE" \
        --flavor "$FLAVOR" \
        --network "$NETWORK" \
        --key-name "$KEYPAIR" \
        --security-group "$SEC_GROUP" \
        "$VM_NAME"

    echo "[SUCCESS] VM $VM_NAME provisioned with secure defaults."
    openstack server list --name "$VM_NAME"
}

assign_rbac() {
    echo "[INFO] Assigning RBAC roles..."
    # Example: Assign reader role to a user (replace with actual user/project/role)
    # openstack role add --user <user> --project <project> reader
    echo "[TODO] Customize RBAC assignments here."
}

rollback_provisioning() {
    echo "[INFO] Rolling back provisioning..."
    openstack server delete "$VM_NAME"
    echo "[SUCCESS] VM $VM_NAME deleted."
}

# ========== MAIN LOGIC ==========

case "$1" in
    --revert)
        rollback_provisioning
        ;;
    --rbac)
        assign_rbac
        ;;
    *)
        create_security_group
        provision_vm
        ;;
esac
