<div align="center">
 
  <h2 align="center">Cloudflare - Turnstile Solver</h2>
  <p align="center">
A Python-based Turnstile solver using the patchright library, featuring multi-threaded execution, API integration, and support for different browsers. It solves CAPTCHAs quickly and efficiently, with customizable configurations and detailed logging.
  </p>
</div>

### ⚙️ Installation Instructions

1. **Ensure Python 3.8+ is installed** on your system.

2. **Create a Python virtual environment**:

   ```bash
   python -m venv venv
   ```

3. **Activate the virtual environment**:

   - On **Windows**:
     ```bash
     venv\Scripts\activate
     ```
   - On **macOS/Linux**:
     ```bash
     source venv/bin/activate
     ```

4. **Install required dependencies**:

   ```bash
   pip install -r requirements.txt
   ```

5. **Select the browser to install**:
   You can choose between **Chromium**, **Chrome**, **Edge** or **Camoufox**:
   No need to install browser on windows if using linux install Edge

   - To install **Chromium**:
     ```bash
     python -m patchright install chromium
     ```
   - To install **Chrome**:
     - On **macOS/Windows**: [Click here](https://www.google.com/chrome/)
     - On **Linux (Debian/Ubuntu-based)**:
       ```bash
       apt update
       wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
       apt install -y ./google-chrome-stable_current_amd64.deb
       apt -f install -y  # Fix dependencies if needed
       rm ./google-chrome-stable_current_amd64.deb
       ```
   - To install **Edge**:
     ```bash
     python -m patchright install msedge
     ```
   - To install **Camoufox**:
     ```bash
     python -m camoufox fetch
     ```

6. **Start testing**:
   ```bash
   python api_solver.py
   ```

---

### 🔥 Features

- **Debug Logging**: Detailed debug logs track actions and progress, making troubleshooting straightforward.
- **Automated CAPTCHA Solver**: Uses Playwright to launch a browser, navigate to the target page, and dynamically injects a CAPTCHA solver.
- **Multi-threaded Mode**: Supports multi-threaded execution, allowing multiple browser instances to run concurrently, speeding up processing.
- **Persistent Browser Context**: Uses a persistent context browser for better security and session management across multiple runs.
- **API Server Integration**: Implements an API server for easy integration, offering customizable configurations like host and port, and exposing essential functions.
- **Customizable Browser Context**: Sets browser options like headless mode, sandboxing, and disabling unnecessary features to optimize performance.
- **Responsive CAPTCHA Interaction**: Adjusts CAPTCHA display, clicks on it, and retrieves the response through repeated attempts if necessary.
- **Timeout and Retries**: Implements a retry loop with configurable timeouts, ensuring robust attempts to retrieve the CAPTCHA token.
- **Elapsed Time Tracking**: Logs and returns elapsed time for solving CAPTCHA, providing an efficiency metric.
- **Error Handling**: Returns detailed status messages on success or failure, allowing for straightforward integration and feedback.

### 📡 API Documentation

#### Solve turnstile

```http
  GET /turnstile?url=https://example.com&sitekey=0x4AAAAAAA
```

#### Request Parameters:

| Parameter | Type   | Description                                                          | Required |
| --------- | ------ | -------------------------------------------------------------------- | -------- |
| `url`     | string | The target URL containing the CAPTCHA. (e.g., `https://example.com`) | Yes      |
| `sitekey` | string | The site key for the CAPTCHA to be solved. (e.g., `0x4AAAAAAA`)      | Yes      |
| `action`  | string | Action to trigger during CAPTCHA solving, e.g., `login`              | No       |
| `cdata`   | string | Custom data that can be used for additional CAPTCHA parameters.      | No       |

#### Response:

If the request is successfully received, the server will respond with a `task_id` for the CAPTCHA solving task:

```json
{
  "task_id": "d2cbb257-9c37-4f9c-9bc7-1eaee72d96a8"
}
```

#### Get Result

```http
  GET /result?id=f0dbe75b-fa76-41ad-89aa-4d3a392040af
```

#### Request Parameters:

| Parameter | Type   | Description                                                | Required |
| --------- | ------ | ---------------------------------------------------------- | -------- |
| `id`      | string | The unique task ID returned from the `/turnstile` request. | Yes      |

#### Response:

If the CAPTCHA is solved successfully, the server will respond with the following information:

```json
{
  "elapsed_time": 7.625,
  "value": "0.KBtT-r"
}
```

#### restart app

```http
  post /restart
```

#### Response:

To restart the api

```json
{
  "message": "Server restart initiated",
  "status": "success"
}
```

---

Original code by [Theyka](https://github.com/Theyka/Turnstile-Solver)
Just added some modification
