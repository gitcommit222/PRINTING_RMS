-- CreateTable
CREATE TABLE "Services" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "salesId" INTEGER,
    "serviceCategory" TEXT NOT NULL,

    CONSTRAINT "Services_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Sales" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "clientName" TEXT NOT NULL,
    "clientTinID" INTEGER,
    "clientAddress" TEXT NOT NULL,

    CONSTRAINT "Sales_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Services" ADD CONSTRAINT "Services_salesId_fkey" FOREIGN KEY ("salesId") REFERENCES "Sales"("id") ON DELETE SET NULL ON UPDATE CASCADE;
