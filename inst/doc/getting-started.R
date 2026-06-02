## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 4,
  eval = FALSE
)

## -----------------------------------------------------------------------------
# library(blisa)
# library(scider)
# library(CellChat)
# library(patchwork)

## -----------------------------------------------------------------------------
# spe <- readRDS(
#   system.file("extdata", "xenium380Cell_spe.rds", package = "blisa")
# )
# 
# dim(spe)

## -----------------------------------------------------------------------------
# cell_type_colors <- c(
#   RColorBrewer::brewer.pal(7, "Set1"),
#   RColorBrewer::brewer.pal(6, "Set2")
# )
# 
# names(cell_type_colors) <- unique(spe$cell_type)
# 
# scider::plotSpatial(
#   spe,
#   group.by = "cell_type",
#   pt.size = 0.2,
#   pt.alpha = 0.9,
#   cols = cell_type_colors
# )

## -----------------------------------------------------------------------------
# counts_matrix <- SummarizedExperiment::assay(spe, "counts")
# 
# LR_pairs_filtered <- filterLRpairs(
#   counts = counts_matrix,
#   min_ligand = 1,
#   min_receptor = 1,
#   LR_df = CellChatDB.human$interaction
# )
# 
# head(LR_pairs_filtered)

## -----------------------------------------------------------------------------
# system.time(BLISAres<- runBLISA.spe.isolates.removed(
#     spe,
#     LR_df = LR_pairs_filtered))
# 
# BLISAres$LR_out

## -----------------------------------------------------------------------------
# plotLRIsum(BLISAres$LR_out)

## ----fig.width=15, fig.height=12----------------------------------------------
# plots <- lapply(seq_len(nrow(BLISAres$LR_results)), function(i) {
#   plotHotspots(BLISAres, index = i)
# })
# 
# combined_plot <- patchwork::wrap_plots(plots, ncol = 3)
# 
# combined_plot
# 
# pdf("xenium_LRI_spatial_plots.pdf", width = 15, height = 12)
# print(combined_plot)
# dev.off()

## -----------------------------------------------------------------------------
# # CCI already computed inside blisa() — retrieve directly
# CCIres <- BLISAres$CCI_scores
# 
# # Alternatively, compute on an existing blisa object that lacks CCI_scores:
# # binned  <- hexBinCells(coords, counts_matrix, bin_size = 50, group = cell_type_vec)
# # BLISAres <- runCCI(BLISAres, counts_by_group = binned$counts_by_group)
# # CCIres  <- BLISAres$CCI_scores
# 
# head(CCIres)

## ----fig.height=8, fig.width=8------------------------------------------------
# plotCCI(BLISAres)

## ----fig.height=10, fig.width=9-----------------------------------------------
# plotCCI(BLISAres, sender = "Invasive_Tumor", receiver = "Invasive_Tumor")

## ----fig.height=5, fig.width=6------------------------------------------------
# p <- plotCCIpair(BLISAres, ligand = "CXCL12", receptor = "CXCR4")
# 
# draw(
#   p,
#   heatmap_legend_side = "right",
#   padding = unit(c(5, 5, 10, 10), "mm")
# )

## ----fig.height=7, fig.width=10-----------------------------------------------
# CCIspatial(
#   spe,
#   BLISAres,
#   index = 2
# )

## -----------------------------------------------------------------------------
# sessionInfo()

