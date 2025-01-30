/** @type {import('tailwindcss').Config} */
module.exports = {
	content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
	theme: {
		extend: {},
	},
	plugins: [require('@tailwindcss/typography'), require('daisyui')],
	daisyui: {
		themes: ["dark", "lofi"], // Activamos solo los temas oscuro y lofi
		darkTheme: "dark", // Usamos el tema "dark" de DaisyUI
		logs: false, // Desactiva los logs innecesarios en la consola
	},
};
