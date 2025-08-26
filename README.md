# ☁️ Secure OpenStack VM Provisioning with RBAC

---

## 🔒 Overview
This project automates **secure VM provisioning on OpenStack** while enforcing:
- Role-Based Access Control (RBAC)
- Security groups & firewall rules
- Encrypted network configurations

The goal is to provision cloud workloads in **a secure, repeatable, and auditable way**, reducing risks from misconfigurations.

---

## ⚙️ Features
- Automated VM creation with secure defaults  
- **RBAC policies** applied per user/project  
- **Security groups**: only required ports allowed (SSH, HTTPS)  
- **Logging & auditability** of provisioning actions  
- Configurable via YAML/JSON files  

---

## 📋 Prerequisites
- OpenStack environment (Horizon or CLI access)  
- Python `openstack` CLI installed  
- User account with provisioning rights  
- Git + Bash  

---

## 🚀 Usage
Clone this repository:
```bash
git clone https://github.com/rakshana-cloudsec/secure-openstack-provisioning.git
cd secure-openstack-provisioning

Provision a VM with secure defaults:
bash provision-vm.sh

Apply RBAC policies:
openstack role add --user <user> --project <project> <role>

Apply security groups:
openstack security group rule create --proto tcp --dst-port 22:22 default
```
---
## 📂 Project Structure
secure-openstack-provisioning/
├── provision-vm.sh
├── configs/
│ ├── security-groups.yaml
│ └── rbac-policies.yaml
├── docs/
│ └── security-report.md
└── images/

yaml
Copy
Edit

---

## 📘 Documentation
See [docs/security-report.md](./docs/security-report.md) for:
- Security design principles  
- RBAC model used  
- Compliance references (CIS, ISO, NIST)  
- Safe deployment guidelines  

---

## 🔮 Future Enhancements
- Integrate with **Terraform/Ansible** for IaC scalability  
- Add **Key Vault / Secrets Manager** integration  
- Extend to **multi-cloud provisioning** (AWS/Azure)  

---

## 👤 Author
**Rakshana Kannaya Muralidharan**  
Master of Cybersecurity | Cloud Security & Linux Hardening Enthusiast  

🔗 [GitHub](https://github.com/rakshana-cloudsec) • [LinkedIn](https://www.linkedin.com/in/rakshana-muralidharan/)
