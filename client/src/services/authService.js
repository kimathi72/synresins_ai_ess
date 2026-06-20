import { apiRequest } from "./apiClient"

export const authService = {
  signup(userData) {
    return apiRequest("/api/v1/signup", {
      body: {
        user: userData
      }
    })
  },

  login(credentials) {
    return apiRequest("/api/v1/login", {
      body: {
        user: credentials
      }
    })
  }
}