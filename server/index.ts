import express from "express";
import prisma from "./prisma/prisma";

const app = express();

const PORT = process.env.PORT || 5001;

async function main() {
	try {
		app.listen(PORT, () => {
			console.log(`Server is running on port ${PORT}`);
		});

		await new Promise((resolve) => setTimeout(resolve, 100));
	} catch (error) {
		console.error("Failed to start the server:", error);
		await prisma.$disconnect();
		process.exit(1);
	}
}

console.log("Gitlab")

main()
	.then(async () => {
		await prisma.$disconnect();
	})
	.catch(async (e) => {
		console.error(e);
		await prisma.$disconnect();
		process.exit(1);
	});
