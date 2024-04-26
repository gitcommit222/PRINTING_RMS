import express from "express";
import { PrismaClient } from "@prisma/client";

const app = express();

const PORT = process.env.PORT || 5001;

const prisma = new PrismaClient();

async function main() {
	const sales = await prisma.sales.findMany();
	console.log(sales);
}

main()
	.then(async () => {
		await prisma.$disconnect();
	})
	.catch(async (e) => {
		console.error(e);
		await prisma.$disconnect();
		process.exit(1);
	});

app.listen(PORT, () => {
	console.log(`Server running on port: ${PORT}`);
});
