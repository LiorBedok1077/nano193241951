#!/bin/bash

# התקנת ספריות נדרשות
pip install fastapi uvicorn httpx pydantic

# הורדת Claude-Connect
cd /opt
git clone https://github.com/drbarq/Claude-Connect.git
cd Claude-Connect

# יצירת קובץ קונפיגורציה
cat > config.json << EOF
{
  "openai_base_url": "http://localhost:18000/v1",
  "openai_api_key": "dummy",
  "model": "GLM-5.2",
  "proxy_port": 8080,
  "host": "0.0.0.0"
}
EOF

nohup python claude_connect.py > /var/log/claude_connect.log 2>&1 &
echo "Claude-Connect proxy started on port 8080"
