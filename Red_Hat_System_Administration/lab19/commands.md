
---

### 📄 `commands.sh`
```bash
#!/bin/bash
# Lab 19: Using Red Hat Customer Portal and Cockpit

# --- Install Cockpit ---
sudo dnf install cockpit cockpit-podman -y

# --- Enable and Start Cockpit ---
sudo systemctl enable --now cockpit.socket

# --- Verify Cockpit Status ---
sudo systemctl status cockpit.socket

# --- Configure Firewall for Cockpit ---
sudo firewall-cmd --add-service=cockpit --permanent
sudo firewall-cmd --reload

# --- Verify Cockpit is Listening on Port 9090 ---
sudo ss -tulnp | grep 9090

echo "Now access Cockpit via: https://<your-server-ip>:9090"

