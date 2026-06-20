import { useAuth } from "../context/AuthContext"
import { useNavigate } from "react-router-dom"

export default function AdminPanel() {
  const { user, logout } = useAuth()
  const navigate = useNavigate()

  const handleLogout = () => {
    logout()
    navigate("/login")
  }

  return (
    <div style={{ padding: "20px" }}>
      <h1>Admin Panel</h1>

      <p>Admin: <b>{user?.name}</b></p>
      <p>Email: {user?.email}</p>

      <div style={{ marginTop: "20px" }}>
        <h3>System Controls</h3>

        <ul>
          <li>Manage Users</li>
          <li>Create Sales Reps</li>
          <li>View Reports</li>
        </ul>
      </div>

      <button onClick={handleLogout} style={{ marginTop: "20px" }}>
        Logout
      </button>
    </div>
  )
}