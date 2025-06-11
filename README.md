# Website Vulnerability Scanner

🔒 **Website Vulnerability Scanner** is a web-based application built with Flask and Bootstrap that allows both public users and registered users to scan websites for common security vulnerabilities. It features a user dashboard, admin panel, profile management, scan reports, PDF export, and real-time vulnerability checks.

---

## 🌐 Public Features

- ✅ Scan any website for common vulnerabilities (SQLi, XSS, CSRF, RFI, etc.)
- 📋 View instant report with risk levels and scan details
- 📩 Contact form with email and message submission

## 👤 User Features

- 🛡️ Authenticated user dashboard
- 📊 View scan history grouped by website
- 📥 Download full vulnerability reports as PDF
- 👤 Manage profile with picture upload and security settings
- ✉️ Contact support from dashboard

## 🛠️ Admin Features

- 📂 Admin dashboard with message count and system overview
- 📬 Inbox for managing public contact messages
- 👤 Manage users: activate, delete, or view profiles
- 🧾 View all scan results

---

## ⚙️ Technologies Used

- **Python 3**, **Flask** (backend)
- **Jinja2** templates
- **MySQL** (relational DB)
- **Bootstrap 5**, **Bootstrap Icons**
- **Flask-Login**, **Werkzeug** for authentication
- **FPDF** for PDF export

---

## 🗃️ Database Models

- `User`: Authenticated users (includes profile image, dark mode, notification settings)
- `ScanResult`: Individual scan entries (vulnerability, risk, date, user link)
- `ContactMessage`: Messages sent from the public contact page

---

## 🚀 How to Run

1. Clone the repository:
   ```
   git clone https://github.com/your-repo/wvbs.git
   cd wvbs
   ```

2. Create a virtual environment and install dependencies:
   ```
   python -m venv venv
   source venv/bin/activate
   pip install -r requirements.txt
   ```

3. Configure your database in `config.py`:
   ```
   SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://username:password@localhost:port/dbname'
   ```

4. Run the app:
   ```
   flask run
   ```

5. Access:
   - Public site: `http://localhost:5000/check`
   - Admin panel: `http://localhost:5000/admin/dashboard`

---

## 📁 Folder Structure

```
project/
├── app/
│   ├── templates/
│   │   ├── public/
│   │   ├── user/
│   │   └── admin/
│   ├── static/uploads/
│   ├── routes.py
│   ├── models.py
│   └── ...
├── config.py
├── run.py
└── README.md
```

---

## 📄 License

This project is licensed under [MIT License](LICENSE).

---

## 👨‍💻 Author

Developed by Thivisha Shehan — [10899346@students.plymouth.ac.uk](mailto:10899346@students.plymouth.ac.uk)
