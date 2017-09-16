/*
Question:
What genes are associated with biotin metabolism? What tissues have the highest expression?
*/


select w.path_description, x.kegg_path_id, y.entrez_gene_id,
a.ncbi_gene_id, z.genomic_id, z.gene_description, z.bud_count, z.callus_count,
z.flower_count, z.leaf_count, z.root_count, z.silique_count,
z.stem_count, z.avg_read_count, z.sd_read_count
from kegg_pathway_description w, entrez_to_pathway x, ncbi_to_entrez y,
arabidopsis_genes_to_brassica_read_counts z, genomic_to_ncbi a
where w.kegg_path_id=x.kegg_path_id and x.entrez_gene_id=y.entrez_gene_id
and y.ncbi_gene_id=a.ncbi_gene_id and a.genomic_id=z.genomic_id
and w.path_description='Biotin metabolism';
