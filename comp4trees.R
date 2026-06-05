# ============================================================
# PHYLOGENETIC TREE COMPARISON (STANDARD METHODS)
# RF + KC distances + clustering + heatmaps
# @author Charlotte HERICE
# @date May 2026

# ============================================================

# suppressPackageStartupMessages({
# library(ape)
# library(phangorn)
# library(treespace)
# library(pheatmap)
# library(phytools)
# })


# # -----------------------------
# # 1) Load trees
# # -----------------------------
# files <- list(
#   hMy_MLST = "Trees/hMy_MLST.raxml.bestTree",
#   mgpB     = "Trees/mgpB.raxml.bestTree",
#   cg_MLST  = "Trees/cg_MLST.raxml.bestTree",
#   wg_SNP   = "Trees/wg_SNP.raxml.bestTree"
# )

# trees <- lapply(files, read.tree)

# # ensure same taxa (important)
# common_taxa <- Reduce(intersect, lapply(trees, function(x) x$tip.label))
# # midpoint rooting of phylogenetic trees
# trees <- lapply(trees, midpoint.root)

# tree_names <- names(trees)
# n <- length(trees)

# # ============================================================
# # 2) ROBINSON-FOULDS DISTANCE MATRIX
# # ============================================================

# # RF (OK unrooted aussi mais ici cohérent)
# rf_matrix <- matrix(0,4,4)
# rownames(rf_matrix) <- tree_names
# colnames(rf_matrix) <- tree_names

# for (i in 1:n) {
#   for (j in 1:n) {
#     rf_matrix[i, j] <- RF.dist(trees[[i]], trees[[j]])
#   }
# }

# # RF heatmap
# png("Results/RF_distance_heatmap.png", width = 1800, height = 1600, res = 300)
# pheatmap(
#   rf_matrix,
#   display_numbers = TRUE,
#   number_format = "%.0f",
#   number_color = "white",
#   color = colorRampPalette(c("lightgrey", "darkgrey", "black"))(100),
#   main = "Robinson-Foulds distances between phylogenetic methods"
# )
# dev.off()

# # ============================================================
# # 3) KENDALL–COLIJN DISTANCE MATRIX
# # ============================================================

# tree_list <- structure(trees, class = "multiPhylo")

# # KC distance matrix 
# kc_matrix <- matrix(0,4,4)
# rownames(kc_matrix) <- names(trees)
# colnames(kc_matrix) <- names(trees)

# for (i in 1:4) {
#   for (j in 1:4) {
#     kc_matrix[i, j] <- treespace::treeDist(trees[[i]], trees[[j]])
#   }
# }

# # KC heatmap
# png("Results/KC_distance_heatmap.png", width = 1800, height = 1600, res = 300)
# pheatmap(
#   kc_matrix,
#   display_numbers = TRUE,
#   number_format = "%.2f",
#   number_color = "white",
#   color = colorRampPalette(c("lightgrey", "darkgrey", "black"))(100),
#   main = "Kendall-Colijn distances between phylogenetic methods"
# )
# dev.off()

# # ============================================================
# # 4) CLUSTERING (RF-based dendrogram)
# # ============================================================

# rf_dist <- as.dist(rf_matrix)
# hc_rf <- hclust(rf_dist, method = "average")
# hc_rf <- hclust(as.dist(rf_matrix), method = "complete")

# png("Results/RF_dendrogram.png", width = 1200, height = 1000, res = 300)
# plot(
#   hc_rf,
#   main = "Clustering of phylogenetic methods (RF distance)",
#   xlab = "",
#   sub = "",
#   cex = 1.2,
#   cex.main = 0.7
# )
# dev.off()

# # ============================================================
# # 5) OPTIONAL: combined figure RF + KC
# # ============================================================

# png("Results/RF_KC_combined.png", width = 2000, height = 900, res = 300)
# par(mfrow = c(1,2))

# pheatmap(
#   rf_matrix,
#   color = colorRampPalette(c("white", "blue", "red"))(100),
#   main = "RF distance",
#   silent = TRUE
# )

# pheatmap(
#   kc_matrix,
#   color = colorRampPalette(c("white", "darkgreen", "black"))(100),
#   main = "KC distance",
#   silent = TRUE
# )

# dev.off()

# # ============================================================
# # 6) EXPORT MATRICES
# # ============================================================

# write.csv(rf_matrix, "Results/RF_distance_matrix.csv")
# write.csv(kc_matrix, "Results/KC_distance_matrix.csv")

# cat("✅ Phylogenetic comparison complete (RF + KC)\n")



sessionInfo()


