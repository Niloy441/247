#!/bin/bash

# Configuration from your images
# REPO_ID=""
# HF_TOKEN=""

echo "---- System Starting ----"

# echo "Restoring files from $REPO_ID..."
# huggingface-cli download $REPO_ID --local-dir /home/user/storage --repo-type dataset --token $HF_TOKEN

cat <<EOF > /home/user/auto_backup.sh
#!/bin/bash
while true; do
    sleep 300
    echo "Backing up data to Hugging Face..."
    # huggingface-cli upload $REPO_ID /home/user/storage --repo-type dataset --token $HF_TOKEN
done
EOF

chmod +x /home/user/auto_backup.sh
# /home/user/auto_backup.sh &

echo "---- System is Ready. Access via Web Terminal ----"

# ttyd install করো runtime এ
curl -L https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 -o /tmp/ttyd
chmod +x /tmp/ttyd
/tmp/ttyd --port 7860 --writable bash &

tail -f /dev/null
