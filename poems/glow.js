function toggleText(el) {
  const hidden = el.querySelector("span");
  if (hidden.classList.contains("show")) {
    hidden.classList.remove("show");
    setTimeout(() => hidden.style.display = "none", 400);
  } else {
    hidden.style.display = "inline";
    requestAnimationFrame(() => hidden.classList.add("show"));
  }
}

document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll(".toggle").forEach(el => {
    el.addEventListener("click", () => toggleText(el));
  });
});
