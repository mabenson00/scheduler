import React from "react";
import ReactDOM from "react-dom/client";
import Hello from "./Hello";
document.addEventListener("DOMContentLoaded", () => {
  const rootElement = document.getElementById("react-root");
  const root = ReactDOM.createRoot(rootElement);
  root.render(<Hello name="Michael" />);
});
