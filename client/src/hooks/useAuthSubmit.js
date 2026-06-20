import { useState } from "react"
import { useNavigate } from "react-router-dom"
import { useAuth } from "../context/AuthContext"

export function useAuthSubmit(apiCall) {
  const navigate = useNavigate()
  const { login: authLogin } = useAuth()

  const [loading, setLoading] = useState(false)
  const [error, setError] = useState(null)

  const submit = async (payload) => {
    setLoading(true)
    setError(null)

    try {
      const data = await apiCall(payload)

      const token = data?.token
      const user = data?.user

      if (!token || !user) {
        throw new Error("Invalid server response")
      }

      authLogin(token, user)
      navigate("/dashboard")
    } catch (err) {
      setError(err.message)
    } finally {
      setLoading(false)
    }
  }

  return {
    submit,
    loading,
    error
  }
}