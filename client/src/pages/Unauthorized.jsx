import { useNavigate } from "react-router-dom"

export default function Unauthorized() {
  const navigate = useNavigate()

  return (
    <div style={{ textAlign: "center", padding: "50px" }}>
      <h1>🚫 Access Denied</h1>

      <p>You do not have permission to view this page.</p>

      <button onClick={() => navigate("/dashboard")}>
        Go to Dashboard
      </button>
    </div>
  )
}