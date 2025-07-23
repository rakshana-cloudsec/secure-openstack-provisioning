# 🛡️ Secure Cloud Resource Provisioning Using OpenStack

This project is a capstone implementation of a **self-service portal** that automates **virtual machine (VM)** and **volume provisioning** using **OpenStack APIs**, with integrated **role-based access control (RBAC)** to enhance cloud infrastructure security.

---

## 📌 Project Overview

Organizations often face delays and security risks due to manual provisioning of cloud resources. This project solves that by providing a **secure, automated provisioning system** for virtualized resources using OpenStack.

---

## 🔧 Technologies & Tools Used

- **OpenStack** (Nova, Cinder, Keystone)
- **Python** (OpenStack SDK)
- **RBAC Policy Management**
- **Ubuntu Server (Virtual Lab Environment)**
- **VirtualBox / VMware / KVM** (for testing)
- **Bash Scripts** (for automation)

---

## 🧩 Features

- 🔒 **Role-Based Access Control**  
  Assigns resource provisioning permissions based on user roles (e.g., Admin, Developer, Analyst).

- ⚙️ **Automated VM & Volume Provisioning**  
  Users can deploy compute instances and attach volumes through a self-service portal.

- 🛠️ **Secure Execution Workflow**  
  Each action is logged and validated against pre-defined access policies.

- 🧪 **Isolated Testing Environment**  
  Deployed in a secure, sandboxed OpenStack testbed to simulate real-world multi-user access.

---

## 🚀 Architecture

```plaintext
User Request (Web UI / CLI)
        ↓
Authentication (Keystone + RBAC)
        ↓
Provisioning API Call (Python SDK)
        ↓
Resource Creation (Nova / Cinder)
        ↓
Access Logged and Tracked
