import { useNavigate } from "react-router-dom"

export default function Landing() {
  const navigate = useNavigate()

  return (
    <div style={styles.container}>
      <div style={styles.hero}>
        <h1 style={styles.title}>Welcome to Your SaaS App</h1>

        <p style={styles.subtitle}>
          A modern React + Rails JWT authentication system with role-based access control.
        </p>

        <div style={styles.buttons}>
          <button style={styles.primaryBtn} onClick={() => navigate("/signup")}>
            Get Started
          </button>

          <button style={styles.secondaryBtn} onClick={() => navigate("/login")}>
            Login
          </button>
        </div>
      </div>

      <div style={styles.features}>
        <div style={styles.card}>
          <h3>🔐 Secure Auth</h3>
          <p>JWT-based authentication with Devise backend.</p>
        </div>

        <div style={styles.card}>
          <h3>🧠 Role-Based Access</h3>
          <p>Admin, Sales Rep, and Customer permissions.</p>
        </div>

        <div style={styles.card}>
          <h3>⚡ Fast SPA</h3>
          <p>React + Vite frontend with Rails API backend.</p>
        </div>
      </div>
    </div>
  )
}

const styles = {
  container: {
    minHeight: "100vh",
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    padding: "40px",
    fontFamily: "Arial, sans-serif"
  },

  hero: {
    textAlign: "center",
    marginTop: "80px"
  },

  title: {
    fontSize: "48px",
    marginBottom: "20px"
  },

  subtitle: {
    fontSize: "18px",
    color: "#666",
    maxWidth: "600px",
    margin: "0 auto 30px"
  },

  buttons: {
    display: "flex",
    gap: "15px",
    justifyContent: "center"
  },

  primaryBtn: {
    padding: "12px 24px",
    fontSize: "16px",
    backgroundColor: "#2563eb",
    color: "white",
    border: "none",
    cursor: "pointer",
    borderRadius: "6px"
  },

  secondaryBtn: {
    padding: "12px 24px",
    fontSize: "16px",
    backgroundColor: "#e5e7eb",
    border: "none",
    cursor: "pointer",
    borderRadius: "6px"
  },

  features: {
    display: "flex",
    gap: "20px",
    marginTop: "60px",
    flexWrap: "wrap",
    justifyContent: "center"
  },

  card: {
    width: "250px",
    padding: "20px",
    border: "1px solid #eee",
    borderRadius: "10px",
    textAlign: "center"
  }
}