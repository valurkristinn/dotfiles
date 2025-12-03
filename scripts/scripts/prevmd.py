import webview
import subprocess
import time
import sys
import os
import signal

files = sys.argv[1:] if len(sys.argv) > 1 else [None]
processes = []

# 1. Start processes
for i, file in enumerate(files):
    port = 3333 + i
    cmd = ['gh', 'markdown-preview', '--disable-auto-open', '--port', str(port)]
    if file:
        cmd.append(file)
    
    # start_new_session=True is required to kill the whole group later
    processes.append(subprocess.Popen(cmd, start_new_session=True))

time.sleep(2)

# 2. Check if processes died during sleep (e.g. port error)
for proc in processes:
    if proc.poll() is not None:
        print("Error: A gh process died. Port likely still in use.")

# 3. Create windows
for i in range(len(files)):
    port = 3333 + i
    webview.create_window('', f'http://localhost:{port}', frameless=True)

try:
    webview.start()
finally:
    # 4. cleanup: Force kill (SIGKILL) to free ports instantly
    for proc in processes:
        try:
            os.killpg(os.getpgid(proc.pid), signal.SIGKILL)
        except:
            pass
