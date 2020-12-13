###############FOR CORE GENES##################
#For category V - Defense Mechanisms (6 genes in core)
V_matrix <- matrix(c(13,146,676,4035), nrow = 2, ncol = 2)
fisher.test(x = V_matrix, alternative = "greater")

#For category E - Amino Acid Transport and Mechanism (30 genes in core)
E_matrix <- matrix(c(102,285,587,3896), nrow = 2, ncol = 2)
fisher.test(E_matrix, alternative = "greater")

#For Category J - Translation, Ribosomal Structure and Biogenesis (23 genes in core)
J_matrix <- matrix(c(92,346,597,3835), nrow = 2, ncol = 2)
fisher.test(J_matrix, alternative = "greater")

#For Category G - Carbohydrate Transport and Metabolism (35 genes in core)
G_matrix <- matrix(c(81,238,608,3943), nrow = 2, ncol = 2)
fisher.test(G_matrix, alternative = "greater")

#For Category H - Coenzyme Transport and Metabolism (11 genes in core)
H_matrix <- matrix(c(65,247,624,3934), nrow = 2, ncol = 2)
fisher.test(H_matrix, alternative = "greater")

#For Category T - Signal Transduction Metabolisms (24 genes in core)
T_matrix <- matrix(c(48,202,641,3979), nrow = 2, ncol = 2)
fisher.test(T_matrix, alternative = "greater")

#For Category K - Transcription (12 core genes)
K_matrix <- matrix(c(51,173,638,4008), nrow = 2, ncol = 2)
fisher.test(K_matrix, alternative = "greater")

#For Category M - Cell Wall, Membrane, Envelope Biogenesis (14 genes in core)
M_matrix <- matrix(c(47,224,642,3957), nrow = 2, ncol = 2)
fisher.test(M_matrix, alternative = "greater")

#For Category L - Replication, Recombination, Repair (11 core genes)
L_matrix <- matrix(c(38,169,651,4012), nrow = 2, ncol = 2)
fisher.test(L_matrix, alternative = "greater")

#For Category F - Nucleotide Transport and Metabolism (12 core genes)
F_matrix <- matrix(c(37,120,652,4061), nrow = 2, ncol = 2)
fisher.test(F_matrix, alternative = "greater")

#For Category P - Inorganic Ion Transport and Metabolism (15 core genes)
P_matrix <- matrix(c(36,228,653,3953), nrow = 2, ncol = 2)
fisher.test(P_matrix, alternative = "greater")

#For Category C - Energy Production and Conversion (12 core genes)
C_matrix <- matrix(c(33,385,656,3796), nrow = 2, ncol = 2)
fisher.test(C_matrix, alternative = "greater")

#For Category O - PTM, Protein Turnover, Chaperone (8 genes in core)
O_matrix <- matrix(c(33,185,656,3996), nrow = 2, ncol = 2)
fisher.test(O_matrix, alternative = "greater")

#For Category I - Lipid Transport and Metabolism (27 core genes)
I_matrix <- matrix(c(24,122,665,4059), nrow = 2, ncol = 2)
fisher.test(I_matrix, alternative = "greater")

#For Category D - Cell Cycle Control, Cell Division, Chromosome Partitioning (21 core genes)
D_matrix <- matrix(c(19,189,670,3992), nrow = 2, ncol = 2)
fisher.test(D_matrix, alternative = "greater")

#For Category U - Intracellular Trafficking, Secretion and Vesicular Transport (8 core genes)
U_matrix <- matrix(c(8,99,681,4082), nrow = 2, ncol = 2)
fisher.test(U_matrix, alternative = "greater")

#For Category N
N_matrix <- matrix(c(4,83,685,4098), nrow = 2, ncol = 2)
fisher.test(N_matrix, alternative = "greater")


##############FOR ACCESSORY GENES#################
#For Category V 
V_matrix <- matrix(c(55,146,980,4035), nrow = 2, ncol = 2)
fisher.test(V_matrix, alternative = "greater")

#Category K
K_matrix <- matrix(c(120,173,915,4008), nrow = 2, ncol = 2)
fisher.test(K_matrix, alternative = "greater")

#For Category J 
J_matrix <- matrix(c(109,346,926,3835), nrow = 2, ncol = 2)
fisher.test(J_matrix, alternative = "greater")

#For Category L 
L_matrix <- matrix(c(59,169,976,4012), nrow = 2, ncol = 2)
fisher.test(L_matrix, alternative = "greater")

#For Category D 
D_matrix <- matrix(c(22,189,1013,3992), nrow = 2, ncol = 2)
fisher.test(D_matrix, alternative = "greater")

#For Category T
T_matrix <- matrix(c(94,202,941,3979), nrow = 2, ncol = 2)
fisher.test(T_matrix, alternative = "greater")

#For Category M 
M_matrix <- matrix(c(120,224,915,3957), nrow = 2, ncol = 2)
fisher.test(M_matrix, alternative = "greater")

#For Category N
N_matrix <- matrix(c(23,83,1012,4098), nrow = 2, ncol = 2)
fisher.test(N_matrix, alternative = "greater")

#For Category U
U_matrix <- matrix(c(10,99,1025,4082), nrow = 2, ncol = 2)
fisher.test(U_matrix, alternative = "greater")

#For Category C
C_matrix <- matrix(c(43,385,992,3796), nrow = 2, ncol = 2)
fisher.test(C_matrix, alternative = "greater")

#For Category G 
G_matrix <- matrix(c(118,238,917,3943), nrow = 2, ncol = 2)
fisher.test(G_matrix, alternative = "greater")

#For Category E
E_matrix <- matrix(c(80,177,955,3896), nrow = 2, ncol = 2)
fisher.test(E_matrix, alternative = "greater")

#For Category F
F_matrix <- matrix(c(34,120,1001,4061), nrow = 2, ncol = 2)
fisher.test(F_matrix, alternative = "greater")

#For Category H
H_matrix <- matrix(c(68,247,967,3934), nrow = 2, ncol = 2)
fisher.test(H_matrix, alternative = "greater")

#For Category I
I_matrix <- matrix(c(38,122,997,4059), nrow = 2, ncol = 2)
fisher.test(I_matrix, alternative = "greater")

#For Category P
P_matrix <- matrix(c(54,228,981,3953), nrow = 2, ncol = 2)
fisher.test(P_matrix, alternative = "greater")

#For Category Q
Q_matrix <- matrix(c(13,89,1022,4092), nrow = 2, ncol = 2)
fisher.test(Q_matrix, alternative = "greater")

#For Category X
X_matrix <- matrix(c(6,67,1029,4114), nrow=2, ncol=2)
fisher.test(X_matrix, alternative = "greater")

#For Category O
O_matrix <- matrix(c(45,185,990,4114), nrow=2, ncol=2)
fisher.test(O_matrix, alternative = "greater")

#For Category N
N_matrix <- matrix(c(45,185,990,4114), nrow=2, ncol=2)
fisher.test(N_matrix, alternative = "greater")


#################FOR CHINA REGION#####################
setwd("/Users/pinaronat/Dropbox (Personal)/Objective3_scripts/ChinaCluster")
counts <- read.table("china_counts_categories.txt",header = FALSE)
just_counts <- counts$V3
just_counts <- as.vector(just_counts)
just_counts <- just_counts/104

#For Category V
V_matrix <- matrix(c(just_counts[1],146,(1000-just_counts[1]),(4181-146)), nrow = 2, ncol = 2)
fisher.test(V_matrix, alternative = "greater")

#For Category J
J_matrix <- matrix(c(just_counts[2],346,(1000-just_counts[2]),(4181-346)), nrow = 2, ncol = 2)
fisher.test(J_matrix, alternative = "greater")

#For Category R
R_matrix <- matrix(c(just_counts[3],283,(1000-just_counts[3]),(4181-283)), nrow = 2, ncol = 2)
fisher.test(R_matrix, alternative = "greater")

#For Cateorgy T
T_matrix <- matrix(c(just_counts[4],202,(1000-just_counts[4]),(4181-202)), nrow = 2, ncol = 2)
fisher.test(T_matrix, alternative = "greater")

#For Category K
K_matrix <- matrix(c(just_counts[5],173,(1000-just_counts[5]),(4181-173)), nrow = 2, ncol = 2)
fisher.test(K_matrix, alternative = "greater")

#For Category O
O_matrix <- matrix(c(just_counts[6],185,(1000-just_counts[6]),(4181-185)), nrow = 2, ncol = 2)
fisher.test(O_matrix, alternative = "greater")

#For Category L
L_matrix <- matrix(c(just_counts[7],169,(1000-just_counts[7]),(4181-169)), nrow = 2, ncol = 2)
fisher.test(L_matrix, alternative = "greater")

#For Category E
E_matrix <- matrix(c(just_counts[8],285,(1000-just_counts[8]),(4181-285)), nrow = 2, ncol = 2)
fisher.test(E_matrix, alternative = "greater")

#For Category G
G_matrix <- matrix(c(just_counts[9],238,(1000-just_counts[9]),(4181-238)), nrow = 2, ncol = 2)
fisher.test(G_matrix, alternative = "greater")

#For Category M
M_matrix <- matrix(c(just_counts[10],224,(1000-just_counts[10]),(4181-224)), nrow = 2, ncol = 2)
fisher.test(M_matrix, alternative = "greater")

#For Category C
C_matrix <- matrix(c(just_counts[11],385,(1000-just_counts[11]),(4181-385)), nrow = 2, ncol = 2)
fisher.test(C_matrix, alternative = "greater")

#For Category F
F_matrix <- matrix(c(just_counts[12],120,(1000-just_counts[12]),(4181-120)), nrow = 2, ncol = 2)
fisher.test(F_matrix, alternative = "greater")

#For Category S
S_matrix <- matrix(c(just_counts[13],256,(1000-just_counts[13]),(4181-256)), nrow = 2, ncol = 2)
fisher.test(S_matrix, alternative = "greater")

#For Catgeory H
H_matrix <- matrix(c(just_counts[14],247,(1000-just_counts[14]),(4181-247)), nrow = 2, ncol = 2)
fisher.test(H_matrix, alternative = "greater")

#For Category Q
Q_matrix <- matrix(c(just_counts[15],89,(1000-just_counts[15]),(4181-89)), nrow = 2, ncol = 2)
fisher.test(Q_matrix, alternative = "greater")

#For Category P
P_matrix <- matrix(c(just_counts[16],228,(1000-just_counts[16]),(4181-228)), nrow = 2, ncol = 2)
fisher.test(P_matrix, alternative = "greater")

#For Category N
N_matrix <- matrix(c(just_counts[17],83,(1000-just_counts[17]),(4181-83)), nrow = 2, ncol = 2)
fisher.test(N_matrix, alternative = "greater")

#For Category D
D_matrix <- matrix(c(just_counts[18],189,(1000-just_counts[18]),(4181-189)), nrow = 2, ncol = 2)
fisher.test(D_matrix, alternative = "greater")

#For Category I
I_matrix <- matrix(c(just_counts[19],122,(1000-just_counts[19]),(4181-122)), nrow = 2, ncol = 2)
fisher.test(I_matrix, alternative = "greater")

#For Category U
U_matrix <- matrix(c(just_counts[20],99,(1000-just_counts[20]),(4181-99)), nrow = 2, ncol = 2)
fisher.test(U_matrix, alternative = "greater")

#For Category X
X_matrix <- matrix(c(just_counts[21],67,(1000-just_counts[21]),(4181-67)), nrow = 2, ncol = 2)
fisher.test(X_matrix, alternative = "greater")

####PIE CHART - CORE COGS
slices <- c(92, 51, 38, 8, 19, 13, 48, 47, 4, 33, 33, 81, 102, 37, 65, 24, 36, 2, 28, 2)
labels <-  c("J", "K", "L", "U", "D", "V", "T", "M", "N", "O", "C", "G", "E", "F", "H", "I", "P", "Q", "R", "S")
color = c("cadetblue", "darkslategray3", "darkslategray2", "darkslategray1", "pink3", "pink2", "pink1", "pink", "peachpuff2", "peachpuff1", "khaki3", "khaki2", "khaki1", "khaki", "lightgoldenrod3", "lightgoldenrod2", "lightgoldenrod","lightgoldenrod", "ivory3", "ivory2", "ivory1")

pie(slices, labels, main="Pie Chart of Core Categories", cex.main = 0.75, col = color)


####PIE CHART - ACCESSORY COGS
slices <- c(109, 120, 59, 10, 22, 55, 94, 120, 23, 45, 43, 118, 80, 34, 68, 38, 54, 13, 61, 6, 6)
labels <-  c("J", "K", "L", "U", "D", "V", "T", "M", "N", "O", "C", "G", "E", "F", "H", "I", "P", "Q", "R", "S", "X")
color = c("cadetblue", "darkslategray3", "darkslategray2", "darkslategray1", "pink3", "pink2", "pink1", "pink", "peachpuff2", "peachpuff1", "khaki3", "khaki2", "khaki1", "khaki", "lightgoldenrod3", "lightgoldenrod2", "lightgoldenrod","lightgoldenrod", "ivory3", "ivory2", "ivory1")

pie(slices, labels, main = "Pie Chart of Accessory Categories",cex.main = 0.75, col = color)


#PIE CHART - CHINA COGS
slices <- c(just_counts[2],just_counts[5],just_counts[7],just_counts[20],just_counts[18],just_counts[1],just_counts[4],just_counts[10],just_counts[17],just_counts[15],just_counts[11],just_counts[9],just_counts[8],just_counts[12],just_counts[14],just_counts[19],just_counts[16],just_counts[15],just_counts[3],just_counts[13],just_counts[21])
labels <- c("J", "K", "L", "U", "D", "V", "T", "M", "N", "O", "C", "G", "E", "F", "H", "I", "P", "Q", "R", "S", "X")
color = c("cadetblue", "darkslategray3", "darkslategray2", "darkslategray1", "pink3", "pink2", "pink1", "pink", "peachpuff2", "peachpuff1", "khaki3", "khaki2", "khaki1", "khaki", "lightgoldenrod3", "lightgoldenrod2", "lightgoldenrod","lightgoldenrod", "ivory3", "ivory2", "ivory1")
pie(slices, labels, main = "Pie Chart of China Categories", cex.main = 0.7, col = color)
