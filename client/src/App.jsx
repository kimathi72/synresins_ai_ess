import './App.css'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'

import Signup from './auth/Signup'
import Login from './auth/Login'
import Landing from './pages/Landing'
import ProtectedRoute from "./routes/ProtectedRoute"
import RoleRoute from "./routes/RoleRoute"
import NotFound from "./pages/NotFound"
import Dashboard from "./pages/Dashboard"
import AdminPanel from "./pages/AdminPanel"
import Unauthorized from "./pages/Unauthorized"

function App() {
  return (
    <Router>
      <Routes>

        {/* Public routes */}
        <Route path="/" element={<Landing />} />
        <Route path="/signup" element={<Signup />} />
        <Route path="/login" element={<Login />} />
        <Route path="/unauthorized" element={<Unauthorized />} />
        <Route path="*" element={<NotFound />} />
        {/* Protected route (any logged-in user) */}
        <Route
          path="/dashboard"
          element={
            <ProtectedRoute>
              <Dashboard />
            </ProtectedRoute>
          }
        />

        {/* Admin-only route */}
        <Route
          path="/admin"
          element={
            <RoleRoute allowedRoles={["admin"]}>
              <AdminPanel />
            </RoleRoute>
          }
        />

      </Routes>
    </Router>
  )
}

export default App