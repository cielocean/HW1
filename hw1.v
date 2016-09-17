// hw1.v
// Proving DeMorgan's Law

module demorgan 
(
	input A,		//single bit input
	input B,		//single bit input
	output nA, 		//output intermediate complemented input
	output nB,		//output intermediate complemented input
	output AandB,
	output AorB,
	output nAandB,	//single bit output, ~(A*B)
	output nAornB, 	//single bit output, (~A)+(~B)
	output nAorB, 	//single bit output, ~(A+B)
	output nAandnB	//single bit output, (~A)*(~B)
);	

	wire nA, nB;
	not Ainv(nA, A);	//takes signal A and produces signal nA
	not Binv(nB, B);	//takes signal B and produces signal nB
	

	
	//~(A*B)
	wire AandB;
	and andgate(AandB, A, B);
	not AandBinv(nAandB, AandB);

	//wire AandB = A & B;
	//assign nAandB = ~AandB;



	//(~A)+(~B)
	or orgate(nAornB, nA, nB);

	//assign nAornB = nA | nB;



	//~(A+B)
	wire AorB;
	or orgate(AorB, A, B);
	not AorBinv(nAorB, AorB);

	//wire AorB = A | B;
	//assign nAorB = ~AorB;



	//(~A)*(~B)
	and andgate(nAandnB, nA, nB);	//AND gate produces nAandnB from nA & nB

	//assign nAandnB = nA & nB;

endmodule
