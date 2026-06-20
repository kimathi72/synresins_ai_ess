const defaultHeaders = {
  "Content-Type": "application/json",
  Accept: "application/json"
}

export async function apiRequest(
  url,
  {
    method = "POST",
    body,
    headers = {}
  } = {}
) {
  const response = await fetch(url, {
    method,
    headers: {
      ...defaultHeaders,
      ...headers
    },
    body: body ? JSON.stringify(body) : undefined
  })

  const data = await response.json()

  if (!response.ok) {
    throw new Error(
      data?.status?.message ||
      data?.message ||
      "Request failed"
    )
  }

  return data
}