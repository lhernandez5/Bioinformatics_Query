/*
Question:
What genes in B. oleracea are more highly expressed within the leaf tissue than any others, and are expressed at least 2 st-dev above the mean, and which pathways do these genes affect?
*/

SELECT g.genomic_id, h.kegg_path_id, h.path_description
FROM (
  SELECT e.genomic_id, f.kegg_path_id
  FROM (
    SELECT c.genomic_id, d.entrez_gene_id
    FROM (
      SELECT a.genomic_id, b.ncbi_gene_id
      FROM (
      SELECT genomic_id
      FROM arabidopsis_genes_to_brassica_read_counts
      WHERE leaf_count >= (2*sd_read_count)+avg_read_count
      AND leaf_count >= bud_count
      AND leaf_count >= flower_count
      AND leaf_count >= stem_count
      and leaf_count >= root_count
      and leaf_count >= silique_count
      and leaf_count >= callus_count
      ) a,
      genomic_to_ncbi b
      WHERE a.genomic_id=b.genomic_id
    ) c,
    ncbi_to_entrez d
    WHERE c.ncbi_gene_id=d.ncbi_gene_id
  ) e,
  entrez_to_pathway f
  WHERE e.entrez_gene_id=f.entrez_gene_id
) g,
kegg_pathway_description h
WHERE h.kegg_path_id=g.kegg_path_id;


