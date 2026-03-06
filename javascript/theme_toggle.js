// Theme Toggle Functionality
document.addEventListener('DOMContentLoaded', function() {
  console.log('Theme toggle script loaded');

  const themeToggle = document.getElementById('theme-toggle');
  const body = document.body;

  console.log('Theme toggle element:', themeToggle);

  // Check for saved theme preference or default to light mode
  const currentTheme = localStorage.getItem('theme') || 'light';
  console.log('Current theme from localStorage:', currentTheme);

  body.classList.add(currentTheme + '-theme');

  // Toggle theme function
  function toggleTheme() {
    console.log('Toggle theme clicked');

    if (body.classList.contains('light-theme')) {
      body.classList.remove('light-theme');
      body.classList.add('dark-theme');
      localStorage.setItem('theme', 'dark');
      console.log('Switched to dark theme');
    } else {
      body.classList.remove('dark-theme');
      body.classList.add('light-theme');
      localStorage.setItem('theme', 'light');
      console.log('Switched to light theme');
    }
  }

  // Add click event listener to toggle
  if (themeToggle) {
    themeToggle.addEventListener('click', toggleTheme);
    console.log('Event listener added to theme toggle');
  } else {
    console.error('Theme toggle element not found!');
  }
});