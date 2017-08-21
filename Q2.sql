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

/*
output (sorry I didn't attach the 1075 genes to the slides)

genomic_id  kegg_path_id  path_description
NM_120210.3     00010   Glycolysis / Gluconeogenesis
NM_120211.3     00010   Glycolysis / Gluconeogenesis
AK227701.1      00010   Glycolysis / Gluconeogenesis
BT006455.1      00010   Glycolysis / Gluconeogenesis
NM_115179.5     00040   Pentose and glucuronate interconversions
AK221575.1      00040   Pentose and glucuronate interconversions
NM_115349.6     00040   Pentose and glucuronate interconversions
AY096739.1      00040   Pentose and glucuronate interconversions
AY074331.1      00040   Pentose and glucuronate interconversions
NM_118972.5     00051   Fructose and mannose metabolism
AK228732.1      00051   Fructose and mannose metabolism
BT026124.1      00051   Fructose and mannose metabolism
NM_001334559.1  00052   Galactose metabolism
NM_001334560.1  00052   Galactose metabolism
NM_001036196.2  00052   Galactose metabolism
NM_105957.3     00052   Galactose metabolism
NM_126485.4     00061   Fatty acid biosynthesis
AY099587.1      00061   Fatty acid biosynthesis
AB073746.1      00061   Fatty acid biosynthesis
NM_111269.2     00061   Fatty acid biosynthesis
NM_120535.3     00062   Fatty acid elongation
BT005386.1      00062   Fatty acid elongation
NM_179448.4     00100   Steroid biosynthesis
NM_103623.5     00100   Steroid biosynthesis
BT005166.1      00100   Steroid biosynthesis
NM_001338420.1  00100   Steroid biosynthesis
NM_112872.3     00100   Steroid biosynthesis
NM_180285.4     00100   Steroid biosynthesis
AB493623.1      00100   Steroid biosynthesis
AY096472.1      00100   Steroid biosynthesis
AY072216.1      00100   Steroid biosynthesis
AK226335.1      00100   Steroid biosynthesis
NM_106672.5     00190   Oxidative phosphorylation
AK227631.1      00190   Oxidative phosphorylation
BT006403.1      00190   Oxidative phosphorylation
NM_130026.4     00190   Oxidative phosphorylation
NM_115616.3     00220   Arginine biosynthesis
AY113901.1      00220   Arginine biosynthesis
NM_101289.5     00230   Purine metabolism
JF830009.1      00230   Purine metabolism
NM_101291.3     00230   Purine metabolism
JF830010.1      00230   Purine metabolism
AK175519.1      00230   Purine metabolism
AK175135.1      00230   Purine metabolism
BT010550.1      00230   Purine metabolism
NM_101501.3     00230   Purine metabolism
NM_127208.2     00230   Purine metabolism
NM_111048.4     00230   Purine metabolism
NM_113498.3     00230   Purine metabolism
AY084292.1      00230   Purine metabolism
BT024567.1      00230   Purine metabolism
NM_119640.3     00230   Purine metabolism
AY081611.1      00230   Purine metabolism
AY065123.1      00230   Purine metabolism
NM_123466.3     00230   Purine metabolism
AY084743.1      00230   Purine metabolism
AY079307.1      00230   Purine metabolism
NM_126110.3     00230   Purine metabolism
NM_101289.5     00240   Pyrimidine metabolism
JF830009.1      00240   Pyrimidine metabolism
NM_101291.3     00240   Pyrimidine metabolism
JF830010.1      00240   Pyrimidine metabolism
AK175519.1      00240   Pyrimidine metabolism
AK175135.1      00240   Pyrimidine metabolism
BT010550.1      00240   Pyrimidine metabolism
NM_113498.3     00240   Pyrimidine metabolism
AY084292.1      00240   Pyrimidine metabolism
BT024567.1      00240   Pyrimidine metabolism
NM_001341566.1  00240   Pyrimidine metabolism
NM_118422.4     00240   Pyrimidine metabolism
NM_123466.3     00240   Pyrimidine metabolism
AY084743.1      00240   Pyrimidine metabolism
AY079307.1      00240   Pyrimidine metabolism
NM_125335.4     00240   Pyrimidine metabolism
NM_180891.4     00240   Pyrimidine metabolism
NM_001085303.1  00240   Pyrimidine metabolism
AK226501.1      00240   Pyrimidine metabolism
NM_126110.3     00240   Pyrimidine metabolism
NM_127208.2     00250   Alanine, aspartate and glutamate metabolism
NM_119640.3     00250   Alanine, aspartate and glutamate metabolism
AY081611.1      00250   Alanine, aspartate and glutamate metabolism
AY065123.1      00250   Alanine, aspartate and glutamate metabolism
NM_104959.4     00260   Glycine, serine and threonine metabolism
NM_111840.3     00260   Glycine, serine and threonine metabolism
AY065037.1      00260   Glycine, serine and threonine metabolism
NM_114235.4     00260   Glycine, serine and threonine metabolism
AY095989.1      00260   Glycine, serine and threonine metabolism
BT005817.1      00260   Glycine, serine and threonine metabolism
NM_117233.3     00260   Glycine, serine and threonine metabolism
AB206823.1      00260   Glycine, serine and threonine metabolism
NM_103896.2     00270   Cysteine and methionine metabolism
NM_001333419.1  00270   Cysteine and methionine metabolism
NM_103897.4     00270   Cysteine and methionine metabolism
NM_104465.4     00270   Cysteine and methionine metabolism
AK226657.1      00270   Cysteine and methionine metabolism
BT012558.1      00270   Cysteine and methionine metabolism
NM_001341318.1  00270   Cysteine and methionine metabolism
NM_118020.5     00270   Cysteine and methionine metabolism
NM_119939.3     00270   Cysteine and methionine metabolism
AK221491.1      00270   Cysteine and methionine metabolism
NM_103896.2     00280   Valine, leucine and isoleucine degradation
NM_001333419.1  00280   Valine, leucine and isoleucine degradation
NM_103897.4     00280   Valine, leucine and isoleucine degradation
NM_103896.2     00290   Valine, leucine and isoleucine biosynthesis
NM_001333419.1  00290   Valine, leucine and isoleucine biosynthesis
NM_103897.4     00290   Valine, leucine and isoleucine biosynthesis
NM_111840.3     00290   Valine, leucine and isoleucine biosynthesis
AY065037.1      00290   Valine, leucine and isoleucine biosynthesis
NM_115723.4     00290   Valine, leucine and isoleucine biosynthesis
NM_001203198.1  00290   Valine, leucine and isoleucine biosynthesis
AY096556.1      00290   Valine, leucine and isoleucine biosynthesis
AY065398.1      00290   Valine, leucine and isoleucine biosynthesis
NM_001084840.1  00290   Valine, leucine and isoleucine biosynthesis
NM_001335847.1  00310   Lysine degradation
NM_127902.6     00310   Lysine degradation
NM_148403.5     00310   Lysine degradation
NM_104959.4     00350   Tyrosine metabolism
NM_114235.4     00350   Tyrosine metabolism
AY095989.1      00350   Tyrosine metabolism
BT005817.1      00350   Tyrosine metabolism
NM_104959.4     00360   Phenylalanine metabolism
NM_114235.4     00360   Phenylalanine metabolism
AY095989.1      00360   Phenylalanine metabolism
BT005817.1      00360   Phenylalanine metabolism
NM_119299.3     00380   Tryptophan metabolism
AY085195.1      00380   Tryptophan metabolism
NM_122499.4     00380   Tryptophan metabolism
AY113880.1      00380   Tryptophan metabolism
NM_180745.2     00380   Tryptophan metabolism
NM_001036863.1  00380   Tryptophan metabolism
NM_180746.3     00380   Tryptophan metabolism
AY090382.1      00380   Tryptophan metabolism
NM_122501.3     00380   Tryptophan metabolism
NM_111510.4     00400   Phenylalanine, tyrosine and tryptophan biosynthesis
NM_104959.4     00410   beta-Alanine metabolism
NM_114235.4     00410   beta-Alanine metabolism
AY095989.1      00410   beta-Alanine metabolism
BT005817.1      00410   beta-Alanine metabolism
NM_112690.4     00460   Cyanoamino acid metabolism
AK316900.1      00460   Cyanoamino acid metabolism
AK316840.1      00460   Cyanoamino acid metabolism
AY084864.1      00460   Cyanoamino acid metabolism
NM_120608.2     00460   Cyanoamino acid metabolism
NM_001342806.1  00460   Cyanoamino acid metabolism
NM_128496.2     00480   Glutathione metabolism
NM_128500.4     00480   Glutathione metabolism
NM_001332003.1  00500   Starch and sucrose metabolism
NM_001198038.2  00500   Starch and sucrose metabolism
NM_105296.3     00500   Starch and sucrose metabolism
NM_001335069.1  00500   Starch and sucrose metabolism
AY085500.1      00500   Starch and sucrose metabolism
NM_126224.2     00500   Starch and sucrose metabolism
NM_001084397.1  00500   Starch and sucrose metabolism
NM_112690.4     00500   Starch and sucrose metabolism
AK316900.1      00500   Starch and sucrose metabolism
AK316840.1      00500   Starch and sucrose metabolism
AY084864.1      00500   Starch and sucrose metabolism
NM_105451.4     00511   Other glycan degradation
NM_001334559.1  00511   Other glycan degradation
NM_001334560.1  00511   Other glycan degradation
NM_001036196.2  00511   Other glycan degradation
NM_105957.3     00511   Other glycan degradation
NM_001332391.1  00514   Other types of O-glycan biosynthesis
NM_101793.4     00514   Other types of O-glycan biosynthesis
KJ138999.1      00514   Other types of O-glycan biosynthesis
AK229032.1      00514   Other types of O-glycan biosynthesis
BT025990.1      00514   Other types of O-glycan biosynthesis
NM_106167.3     00514   Other types of O-glycan biosynthesis
KJ138932.1      00514   Other types of O-glycan biosynthesis
AY102148.1      00514   Other types of O-glycan biosynthesis
NM_102845.5     00520   Amino sugar and nucleotide sugar metabolism
NM_001332942.1  00520   Amino sugar and nucleotide sugar metabolism
KJ138907.1      00520   Amino sugar and nucleotide sugar metabolism
NM_127647.2     00520   Amino sugar and nucleotide sugar metabolism
NM_130333.4     00520   Amino sugar and nucleotide sugar metabolism
AK316734.1      00520   Amino sugar and nucleotide sugar metabolism
BT022016.1      00520   Amino sugar and nucleotide sugar metabolism
NM_115302.3     00520   Amino sugar and nucleotide sugar metabolism
AK176488.1      00520   Amino sugar and nucleotide sugar metabolism
NM_116148.3     00520   Amino sugar and nucleotide sugar metabolism
NM_001125421.1  00520   Amino sugar and nucleotide sugar metabolism
NM_001334559.1  00531   Glycosaminoglycan degradation
NM_001334560.1  00531   Glycosaminoglycan degradation
NM_001036196.2  00531   Glycosaminoglycan degradation
NM_105957.3     00531   Glycosaminoglycan degradation
NM_202084.2     00563   Glycosylphosphatidylinositol (GPI)-anchor biosynthesis
NM_101143.4     00563   Glycosylphosphatidylinositol (GPI)-anchor biosynthesis
NM_001334838.1  00564   Glycerophospholipid metabolism
NM_001334840.1  00564   Glycerophospholipid metabolism
NM_001334839.1  00564   Glycerophospholipid metabolism
NM_001334837.1  00564   Glycerophospholipid metabolism
NM_106516.3     00564   Glycerophospholipid metabolism
NM_179585.4     00564   Glycerophospholipid metabolism
NM_106734.2     00564   Glycerophospholipid metabolism
BT043493.1      00564   Glycerophospholipid metabolism
BT043493.1      00564   Glycerophospholipid metabolism
NM_001335309.1  00564   Glycerophospholipid metabolism
NM_126670.3     00564   Glycerophospholipid metabolism
AK221680.1      00564   Glycerophospholipid metabolism
AY344842.1      00564   Glycerophospholipid metabolism
NM_001335309.1  00565   Ether lipid metabolism
NM_126670.3     00565   Ether lipid metabolism
AK221680.1      00565   Ether lipid metabolism
AY344842.1      00565   Ether lipid metabolism
NM_001335309.1  00590   Arachidonic acid metabolism
NM_126670.3     00590   Arachidonic acid metabolism
AK221680.1      00590   Arachidonic acid metabolism
AY344842.1      00590   Arachidonic acid metabolism
NM_001335309.1  00591   Linoleic acid metabolism
NM_126670.3     00591   Linoleic acid metabolism
AK221680.1      00591   Linoleic acid metabolism
AY344842.1      00591   Linoleic acid metabolism
NM_001335309.1  00592   alpha-Linolenic acid metabolism
NM_126670.3     00592   alpha-Linolenic acid metabolism
AK221680.1      00592   alpha-Linolenic acid metabolism
AY344842.1      00592   alpha-Linolenic acid metabolism
NM_001334559.1  00600   Sphingolipid metabolism
NM_001334560.1  00600   Sphingolipid metabolism
NM_001036196.2  00600   Sphingolipid metabolism
NM_105957.3     00600   Sphingolipid metabolism
NM_114737.5     00600   Sphingolipid metabolism
NM_001339379.1  00600   Sphingolipid metabolism
AY114662.1      00600   Sphingolipid metabolism
BT006615.1      00600   Sphingolipid metabolism
NM_114738.2     00600   Sphingolipid metabolism
NM_001339380.1  00600   Sphingolipid metabolism
NM_122272.3     00600   Sphingolipid metabolism
NM_001036855.1  00600   Sphingolipid metabolism
NM_001334559.1  00604   Glycosphingolipid biosynthesis - ganglio series
NM_001334560.1  00604   Glycosphingolipid biosynthesis - ganglio series
NM_001036196.2  00604   Glycosphingolipid biosynthesis - ganglio series
NM_105957.3     00604   Glycosphingolipid biosynthesis - ganglio series
NM_124115.4     00630   Glyoxylate and dicarboxylate metabolism
NM_180814.3     00630   Glyoxylate and dicarboxylate metabolism
AY081459.1      00630   Glyoxylate and dicarboxylate metabolism
NM_124115.4     00670   One carbon pool by folate
NM_180814.3     00670   One carbon pool by folate
AY081459.1      00670   One carbon pool by folate
NM_111048.4     00730   Thiamine metabolism
NM_103896.2     00770   Pantothenate and CoA biosynthesis
NM_001333419.1  00770   Pantothenate and CoA biosynthesis
NM_103897.4     00770   Pantothenate and CoA biosynthesis
NM_115723.4     00770   Pantothenate and CoA biosynthesis
NM_001203198.1  00770   Pantothenate and CoA biosynthesis
AY096556.1      00770   Pantothenate and CoA biosynthesis
AY065398.1      00770   Pantothenate and CoA biosynthesis
NM_001084840.1  00770   Pantothenate and CoA biosynthesis
NM_126485.4     00780   Biotin metabolism
AY099587.1      00780   Biotin metabolism
AB073746.1      00780   Biotin metabolism
NM_111269.2     00780   Biotin metabolism
NM_125140.4     00780   Biotin metabolism
HQ857557.1      00780   Biotin metabolism
EU089963.1      00780   Biotin metabolism
NM_001337803.1  00860   Porphyrin and chlorophyll metabolism
NM_111750.4     00860   Porphyrin and chlorophyll metabolism
AY099706.1      00860   Porphyrin and chlorophyll metabolism
NM_202535.1     00860   Porphyrin and chlorophyll metabolism
NM_180665.1     00860   Porphyrin and chlorophyll metabolism
NM_116558.2     00860   Porphyrin and chlorophyll metabolism
NM_116557.4     00860   Porphyrin and chlorophyll metabolism
BT006346.1      00860   Porphyrin and chlorophyll metabolism
NM_101240.4     00903   Limonene and pinene degradation
BT029218.1      00903   Limonene and pinene degradation
BT022025.1      00903   Limonene and pinene degradation
NM_101424.3     00904   Diterpenoid biosynthesis
AK227590.1      00904   Diterpenoid biosynthesis
BT005827.1      00904   Diterpenoid biosynthesis
NM_104465.4     00920   Sulfur metabolism
AK226657.1      00920   Sulfur metabolism
BT012558.1      00920   Sulfur metabolism
NM_105826.4     00940   Phenylpropanoid biosynthesis
NM_129394.3     00940   Phenylpropanoid biosynthesis
AF452388.1      00940   Phenylpropanoid biosynthesis
AK230233.1      00940   Phenylpropanoid biosynthesis
NM_129395.3     00940   Phenylpropanoid biosynthesis
AY099555.1      00940   Phenylpropanoid biosynthesis
AF452385.1      00940   Phenylpropanoid biosynthesis
NM_112690.4     00940   Phenylpropanoid biosynthesis
AK316900.1      00940   Phenylpropanoid biosynthesis
AK316840.1      00940   Phenylpropanoid biosynthesis
AY084864.1      00940   Phenylpropanoid biosynthesis
NM_118317.4     00940   Phenylpropanoid biosynthesis
NM_001343524.1  00940   Phenylpropanoid biosynthesis
NM_121788.4     00940   Phenylpropanoid biosynthesis
BT002958.1      00940   Phenylpropanoid biosynthesis
NM_121711.5     00944   Flavone and flavonol biosynthesis
KJ138682.1      00944   Flavone and flavonol biosynthesis
AY072325.1      00944   Flavone and flavonol biosynthesis
NM_101240.4     00945   Stilbenoid, diarylheptanoid and gingerol biosynthesis
BT029218.1      00945   Stilbenoid, diarylheptanoid and gingerol biosynthesis
BT022025.1      00945   Stilbenoid, diarylheptanoid and gingerol biosynthesis
NM_104959.4     00950   Isoquinoline alkaloid biosynthesis
NM_114235.4     00950   Isoquinoline alkaloid biosynthesis
AY095989.1      00950   Isoquinoline alkaloid biosynthesis
BT005817.1      00950   Isoquinoline alkaloid biosynthesis
NM_104959.4     00960   Tropane, piperidine and pyridine alkaloid biosynthesis
NM_114235.4     00960   Tropane, piperidine and pyridine alkaloid biosynthesis
AY095989.1      00960   Tropane, piperidine and pyridine alkaloid biosynthesis
BT005817.1      00960   Tropane, piperidine and pyridine alkaloid biosynthesis
NM_119299.3     00966   Glucosinolate biosynthesis
AY085195.1      00966   Glucosinolate biosynthesis
NM_120608.2     00966   Glucosinolate biosynthesis
NM_001342806.1  00966   Glucosinolate biosynthesis
NM_111331.5     00970   Aminoacyl-tRNA biosynthesis
AY080709.1      00970   Aminoacyl-tRNA biosynthesis
NM_202490.2     00970   Aminoacyl-tRNA biosynthesis
NM_001084635.1  00970   Aminoacyl-tRNA biosynthesis
AK226252.1      00970   Aminoacyl-tRNA biosynthesis
NM_111269.2     01040   Biosynthesis of unsaturated fatty acids
NM_202084.2     01100   Metabolic pathways
NM_101143.4     01100   Metabolic pathways
NM_101240.4     01100   Metabolic pathways
BT029218.1      01100   Metabolic pathways
BT022025.1      01100   Metabolic pathways
NM_101501.3     01100   Metabolic pathways
NM_102312.3     01100   Metabolic pathways
NM_001123877.5  01100   Metabolic pathways
NM_001198161.1  01100   Metabolic pathways
NM_179375.4     01100   Metabolic pathways
NM_102845.5     01100   Metabolic pathways
NM_001332942.1  01100   Metabolic pathways
NM_179448.4     01100   Metabolic pathways
NM_103623.5     01100   Metabolic pathways
BT005166.1      01100   Metabolic pathways
NM_103896.2     01100   Metabolic pathways
NM_001333419.1  01100   Metabolic pathways
NM_103897.4     01100   Metabolic pathways
NM_104465.4     01100   Metabolic pathways
AK226657.1      01100   Metabolic pathways
BT012558.1      01100   Metabolic pathways
NM_104959.4     01100   Metabolic pathways
NM_105826.4     01100   Metabolic pathways
NM_001334559.1  01100   Metabolic pathways
NM_001334560.1  01100   Metabolic pathways
NM_001036196.2  01100   Metabolic pathways
NM_105957.3     01100   Metabolic pathways
NM_106672.5     01100   Metabolic pathways
AK227631.1      01100   Metabolic pathways
BT006403.1      01100   Metabolic pathways
NM_179585.4     01100   Metabolic pathways
NM_106734.2     01100   Metabolic pathways
BT043493.1      01100   Metabolic pathways
BT043493.1      01100   Metabolic pathways
NM_126485.4     01100   Metabolic pathways
AY099587.1      01100   Metabolic pathways
AB073746.1      01100   Metabolic pathways
NM_001335309.1  01100   Metabolic pathways
NM_126670.3     01100   Metabolic pathways
AK221680.1      01100   Metabolic pathways
AY344842.1      01100   Metabolic pathways
NM_127208.2     01100   Metabolic pathways
NM_129394.3     01100   Metabolic pathways
AF452388.1      01100   Metabolic pathways
AK230233.1      01100   Metabolic pathways
NM_129395.3     01100   Metabolic pathways
AY099555.1      01100   Metabolic pathways
AF452385.1      01100   Metabolic pathways
NM_130026.4     01100   Metabolic pathways
NM_130333.4     01100   Metabolic pathways
AK316734.1      01100   Metabolic pathways
BT022016.1      01100   Metabolic pathways
NM_111048.4     01100   Metabolic pathways
NM_111269.2     01100   Metabolic pathways
NM_111510.4     01100   Metabolic pathways
NM_111840.3     01100   Metabolic pathways
AY065037.1      01100   Metabolic pathways
NM_112690.4     01100   Metabolic pathways
AK316900.1      01100   Metabolic pathways
AK316840.1      01100   Metabolic pathways
AY084864.1      01100   Metabolic pathways
NM_001338420.1  01100   Metabolic pathways
NM_112872.3     01100   Metabolic pathways
NM_180285.4     01100   Metabolic pathways
AB493623.1      01100   Metabolic pathways
AY096472.1      01100   Metabolic pathways
AY072216.1      01100   Metabolic pathways
AK226335.1      01100   Metabolic pathways
NM_113498.3     01100   Metabolic pathways
AY084292.1      01100   Metabolic pathways
BT024567.1      01100   Metabolic pathways
NM_114235.4     01100   Metabolic pathways
AY095989.1      01100   Metabolic pathways
BT005817.1      01100   Metabolic pathways
NM_114737.5     01100   Metabolic pathways
NM_001339379.1  01100   Metabolic pathways
AY114662.1      01100   Metabolic pathways
BT006615.1      01100   Metabolic pathways
NM_114738.2     01100   Metabolic pathways
NM_001339380.1  01100   Metabolic pathways
NM_115302.3     01100   Metabolic pathways
AK176488.1      01100   Metabolic pathways
NM_115616.3     01100   Metabolic pathways
AY113901.1      01100   Metabolic pathways
NM_115723.4     01100   Metabolic pathways
NM_001203198.1  01100   Metabolic pathways
AY096556.1      01100   Metabolic pathways
AY065398.1      01100   Metabolic pathways
NM_001084840.1  01100   Metabolic pathways
NM_116148.3     01100   Metabolic pathways
NM_001125421.1  01100   Metabolic pathways
NM_116558.2     01100   Metabolic pathways
NM_116557.4     01100   Metabolic pathways
BT006346.1      01100   Metabolic pathways
NM_117233.3     01100   Metabolic pathways
AB206823.1      01100   Metabolic pathways
NM_001341318.1  01100   Metabolic pathways
NM_118020.5     01100   Metabolic pathways
NM_118317.4     01100   Metabolic pathways
NM_001341566.1  01100   Metabolic pathways
NM_118422.4     01100   Metabolic pathways
NM_119640.3     01100   Metabolic pathways
AY081611.1      01100   Metabolic pathways
AY065123.1      01100   Metabolic pathways
NM_119939.3     01100   Metabolic pathways
AK221491.1      01100   Metabolic pathways
NM_120210.3     01100   Metabolic pathways
NM_120211.3     01100   Metabolic pathways
AK227701.1      01100   Metabolic pathways
BT006455.1      01100   Metabolic pathways
NM_121711.5     01100   Metabolic pathways
KJ138682.1      01100   Metabolic pathways
AY072325.1      01100   Metabolic pathways
NM_001343524.1  01100   Metabolic pathways
NM_121788.4     01100   Metabolic pathways
BT002958.1      01100   Metabolic pathways
NM_122272.3     01100   Metabolic pathways
NM_001036855.1  01100   Metabolic pathways
NM_123466.3     01100   Metabolic pathways
AY084743.1      01100   Metabolic pathways
AY079307.1      01100   Metabolic pathways
NM_125140.4     01100   Metabolic pathways
HQ857557.1      01100   Metabolic pathways
EU089963.1      01100   Metabolic pathways
NM_125335.4     01100   Metabolic pathways
NM_180891.4     01100   Metabolic pathways
NM_001085303.1  01100   Metabolic pathways
AK226501.1      01100   Metabolic pathways
NM_126110.3     01100   Metabolic pathways
NM_101240.4     01110   Biosynthesis of secondary metabolites
BT029218.1      01110   Biosynthesis of secondary metabolites
BT022025.1      01110   Biosynthesis of secondary metabolites
NM_101424.3     01110   Biosynthesis of secondary metabolites
AK227590.1      01110   Biosynthesis of secondary metabolites
BT005827.1      01110   Biosynthesis of secondary metabolites
NM_101501.3     01110   Biosynthesis of secondary metabolites
NM_103896.2     01110   Biosynthesis of secondary metabolites
NM_001333419.1  01110   Biosynthesis of secondary metabolites
NM_103897.4     01110   Biosynthesis of secondary metabolites
NM_104465.4     01110   Biosynthesis of secondary metabolites
AK226657.1      01110   Biosynthesis of secondary metabolites
BT012558.1      01110   Biosynthesis of secondary metabolites
NM_104959.4     01110   Biosynthesis of secondary metabolites
NM_105826.4     01110   Biosynthesis of secondary metabolites
NM_179585.4     01110   Biosynthesis of secondary metabolites
NM_106734.2     01110   Biosynthesis of secondary metabolites
BT043493.1      01110   Biosynthesis of secondary metabolites
BT043493.1      01110   Biosynthesis of secondary metabolites
NM_001335309.1  01110   Biosynthesis of secondary metabolites
NM_126670.3     01110   Biosynthesis of secondary metabolites
AK221680.1      01110   Biosynthesis of secondary metabolites
AY344842.1      01110   Biosynthesis of secondary metabolites
NM_127208.2     01110   Biosynthesis of secondary metabolites
NM_129394.3     01110   Biosynthesis of secondary metabolites
AF452388.1      01110   Biosynthesis of secondary metabolites
AK230233.1      01110   Biosynthesis of secondary metabolites
NM_129395.3     01110   Biosynthesis of secondary metabolites
AY099555.1      01110   Biosynthesis of secondary metabolites
AF452385.1      01110   Biosynthesis of secondary metabolites
NM_111048.4     01110   Biosynthesis of secondary metabolites
NM_111510.4     01110   Biosynthesis of secondary metabolites
NM_001337803.1  01110   Biosynthesis of secondary metabolites
NM_111750.4     01110   Biosynthesis of secondary metabolites
AY099706.1      01110   Biosynthesis of secondary metabolites
NM_202535.1     01110   Biosynthesis of secondary metabolites
NM_180665.1     01110   Biosynthesis of secondary metabolites
NM_111840.3     01110   Biosynthesis of secondary metabolites
AY065037.1      01110   Biosynthesis of secondary metabolites
NM_112690.4     01110   Biosynthesis of secondary metabolites
AK316900.1      01110   Biosynthesis of secondary metabolites
AK316840.1      01110   Biosynthesis of secondary metabolites
AY084864.1      01110   Biosynthesis of secondary metabolites
NM_001338420.1  01110   Biosynthesis of secondary metabolites
NM_112872.3     01110   Biosynthesis of secondary metabolites
NM_180285.4     01110   Biosynthesis of secondary metabolites
AB493623.1      01110   Biosynthesis of secondary metabolites
AY096472.1      01110   Biosynthesis of secondary metabolites
AY072216.1      01110   Biosynthesis of secondary metabolites
AK226335.1      01110   Biosynthesis of secondary metabolites
NM_114235.4     01110   Biosynthesis of secondary metabolites
AY095989.1      01110   Biosynthesis of secondary metabolites
BT005817.1      01110   Biosynthesis of secondary metabolites
NM_115616.3     01110   Biosynthesis of secondary metabolites
AY113901.1      01110   Biosynthesis of secondary metabolites
NM_115723.4     01110   Biosynthesis of secondary metabolites
NM_001203198.1  01110   Biosynthesis of secondary metabolites
AY096556.1      01110   Biosynthesis of secondary metabolites
AY065398.1      01110   Biosynthesis of secondary metabolites
NM_001084840.1  01110   Biosynthesis of secondary metabolites
NM_116558.2     01110   Biosynthesis of secondary metabolites
NM_116557.4     01110   Biosynthesis of secondary metabolites
BT006346.1      01110   Biosynthesis of secondary metabolites
NM_118317.4     01110   Biosynthesis of secondary metabolites
NM_119299.3     01110   Biosynthesis of secondary metabolites
AY085195.1      01110   Biosynthesis of secondary metabolites
NM_119640.3     01110   Biosynthesis of secondary metabolites
AY081611.1      01110   Biosynthesis of secondary metabolites
AY065123.1      01110   Biosynthesis of secondary metabolites
NM_119939.3     01110   Biosynthesis of secondary metabolites
AK221491.1      01110   Biosynthesis of secondary metabolites
NM_120210.3     01110   Biosynthesis of secondary metabolites
NM_120211.3     01110   Biosynthesis of secondary metabolites
AK227701.1      01110   Biosynthesis of secondary metabolites
BT006455.1      01110   Biosynthesis of secondary metabolites
NM_120535.3     01110   Biosynthesis of secondary metabolites
BT005386.1      01110   Biosynthesis of secondary metabolites
NM_120608.2     01110   Biosynthesis of secondary metabolites
NM_001342806.1  01110   Biosynthesis of secondary metabolites
NM_121711.5     01110   Biosynthesis of secondary metabolites
KJ138682.1      01110   Biosynthesis of secondary metabolites
AY072325.1      01110   Biosynthesis of secondary metabolites
NM_001343524.1  01110   Biosynthesis of secondary metabolites
NM_121788.4     01110   Biosynthesis of secondary metabolites
BT002958.1      01110   Biosynthesis of secondary metabolites
NM_104465.4     01200   Carbon metabolism
AK226657.1      01200   Carbon metabolism
BT012558.1      01200   Carbon metabolism
NM_111840.3     01200   Carbon metabolism
AY065037.1      01200   Carbon metabolism
NM_103896.2     01210   2-Oxocarboxylic acid metabolism
NM_001333419.1  01210   2-Oxocarboxylic acid metabolism
NM_103897.4     01210   2-Oxocarboxylic acid metabolism
NM_115616.3     01210   2-Oxocarboxylic acid metabolism
AY113901.1      01210   2-Oxocarboxylic acid metabolism
NM_115723.4     01210   2-Oxocarboxylic acid metabolism
NM_001203198.1  01210   2-Oxocarboxylic acid metabolism
AY096556.1      01210   2-Oxocarboxylic acid metabolism
AY065398.1      01210   2-Oxocarboxylic acid metabolism
NM_001084840.1  01210   2-Oxocarboxylic acid metabolism
NM_119299.3     01210   2-Oxocarboxylic acid metabolism
AY085195.1      01210   2-Oxocarboxylic acid metabolism
NM_120608.2     01210   2-Oxocarboxylic acid metabolism
NM_001342806.1  01210   2-Oxocarboxylic acid metabolism
NM_126485.4     01212   Fatty acid metabolism
AY099587.1      01212   Fatty acid metabolism
AB073746.1      01212   Fatty acid metabolism
NM_111269.2     01212   Fatty acid metabolism
NM_103896.2     01230   Biosynthesis of amino acids
NM_001333419.1  01230   Biosynthesis of amino acids
NM_103897.4     01230   Biosynthesis of amino acids
NM_104465.4     01230   Biosynthesis of amino acids
AK226657.1      01230   Biosynthesis of amino acids
BT012558.1      01230   Biosynthesis of amino acids
NM_111510.4     01230   Biosynthesis of amino acids
NM_111840.3     01230   Biosynthesis of amino acids
AY065037.1      01230   Biosynthesis of amino acids
NM_115616.3     01230   Biosynthesis of amino acids
AY113901.1      01230   Biosynthesis of amino acids
NM_115723.4     01230   Biosynthesis of amino acids
NM_001203198.1  01230   Biosynthesis of amino acids
AY096556.1      01230   Biosynthesis of amino acids
AY065398.1      01230   Biosynthesis of amino acids
NM_001084840.1  01230   Biosynthesis of amino acids
NM_101414.4     03008   Ribosome biogenesis in eukaryotes
AY065425.1      03008   Ribosome biogenesis in eukaryotes
NM_202107.1     03008   Ribosome biogenesis in eukaryotes
NM_102415.5     03008   Ribosome biogenesis in eukaryotes
NM_127871.5     03008   Ribosome biogenesis in eukaryotes
AY081478.1      03008   Ribosome biogenesis in eukaryotes
NM_001337019.1  03008   Ribosome biogenesis in eukaryotes
NM_201949.2     03008   Ribosome biogenesis in eukaryotes
NM_129881.3     03008   Ribosome biogenesis in eukaryotes
NM_001202810.1  03008   Ribosome biogenesis in eukaryotes
NM_180058.2     03008   Ribosome biogenesis in eukaryotes
NM_130186.5     03008   Ribosome biogenesis in eukaryotes
NM_001084599.1  03008   Ribosome biogenesis in eukaryotes
NM_130366.3     03008   Ribosome biogenesis in eukaryotes
NM_114869.1     03008   Ribosome biogenesis in eukaryotes
NM_114870.4     03008   Ribosome biogenesis in eukaryotes
NM_001339453.1  03008   Ribosome biogenesis in eukaryotes
EU682309.1      03008   Ribosome biogenesis in eukaryotes
EU682309.1      03008   Ribosome biogenesis in eukaryotes
BT030315.1      03008   Ribosome biogenesis in eukaryotes
NM_120901.4     03008   Ribosome biogenesis in eukaryotes
NM_001203331.1  03008   Ribosome biogenesis in eukaryotes
NM_100651.5     03010   Ribosome
NM_001331728.1  03010   Ribosome
AK317713.1      03010   Ribosome
NM_202054.3     03010   Ribosome
NM_179342.3     03010   Ribosome
NM_101461.5     03010   Ribosome
AY084613.1      03010   Ribosome
NM_001036297.2  03010   Ribosome
AY079378.1      03010   Ribosome
NM_127531.4     03010   Ribosome
NM_001084451.1  03010   Ribosome
NM_127532.4     03010   Ribosome
AY072459.1      03010   Ribosome
NM_129559.3     03010   Ribosome
NM_129613.5     03010   Ribosome
BT026422.1      03010   Ribosome
BT020291.1      03010   Ribosome
NM_129748.4     03010   Ribosome
NM_180045.4     03010   Ribosome
AK228536.1      03010   Ribosome
NM_129907.3     03010   Ribosome
NM_111074.4     03010   Ribosome
NM_111124.4     03010   Ribosome
NM_001337417.1  03010   Ribosome
AY072616.1      03010   Ribosome
NM_180173.2     03010   Ribosome
NM_111429.5     03010   Ribosome
AY096581.1      03010   Ribosome
AY065359.1      03010   Ribosome
NM_202500.2     03010   Ribosome
NM_001084643.1  03010   Ribosome
BT006523.1      03010   Ribosome
NM_111507.2     03010   Ribosome
NM_111897.4     03010   Ribosome
AY091313.1      03010   Ribosome
NM_112072.3     03010   Ribosome
BT003736.1      03010   Ribosome
NM_112478.4     03010   Ribosome
NM_001338207.1  03010   Ribosome
AY085343.1      03010   Ribosome
AK226477.1      03010   Ribosome
BT025571.1      03010   Ribosome
NM_113120.3     03010   Ribosome
AY093389.1      03010   Ribosome
AY091218.1      03010   Ribosome
NM_114266.2     03010   Ribosome
NM_001339120.1  03010   Ribosome
NM_114269.3     03010   Ribosome
NM_115249.4     03010   Ribosome
AY081547.1      03010   Ribosome
AY065200.1      03010   Ribosome
NM_001084811.1  03010   Ribosome
NM_115732.4     03010   Ribosome
NM_118493.4     03010   Ribosome
NM_001203885.1  03010   Ribosome
AY114723.1      03010   Ribosome
AY072437.1      03010   Ribosome
NM_119084.3     03010   Ribosome
NM_120151.3     03010   Ribosome
AY093190.1      03010   Ribosome
BT006553.1      03010   Ribosome
NM_121014.4     03010   Ribosome
AK228114.1      03010   Ribosome
BT003108.1      03010   Ribosome
NM_121074.5     03010   Ribosome
NM_001203345.1  03010   Ribosome
AY093783.1      03010   Ribosome
NM_001125755.2  03010   Ribosome
NM_121618.4     03010   Ribosome
AK227242.1      03010   Ribosome
BT024914.1      03010   Ribosome
NM_001343815.1  03010   Ribosome
NM_147907.4     03010   Ribosome
AK227904.1      03010   Ribosome
BT012239.1      03010   Ribosome
BT011601.1      03010   Ribosome
NM_122659.4     03010   Ribosome
AK228333.1      03010   Ribosome
BT003099.1      03010   Ribosome
NM_125054.3     03010   Ribosome
NM_001085289.1  03010   Ribosome
NM_125076.4     03010   Ribosome
NM_125378.4     03010   Ribosome
AK317713.1      03010   Ribosome
NM_126151.2     03010   Ribosome
AY081628.1      03010   Ribosome
AY065109.1      03010   Ribosome
NM_001331983.1  03013   RNA transport
NM_001035946.2  03013   RNA transport
NM_179308.4     03013   RNA transport
NM_001331982.1  03013   RNA transport
NM_001331981.1  03013   RNA transport
NM_101013.1     03013   RNA transport
BT005041.1      03013   RNA transport
BT004216.1      03013   RNA transport
NM_001334525.1  03013   RNA transport
NM_105893.4     03013   RNA transport
NM_001334524.1  03013   RNA transport
NM_127899.4     03013   RNA transport
AY079389.1      03013   RNA transport
NM_001337019.1  03013   RNA transport
NM_201949.2     03013   RNA transport
NM_129881.3     03013   RNA transport
NM_001202810.1  03013   RNA transport
NM_180058.2     03013   RNA transport
NM_111973.4     03013   RNA transport
NM_001161135.1  03013   RNA transport
AY074582.1      03013   RNA transport
NM_112502.5     03013   RNA transport
NM_112509.2     03013   RNA transport
AX765882.1      03013   RNA transport
NM_115549.5     03013   RNA transport
BT005366.1      03013   RNA transport
NM_119444.4     03013   RNA transport
AY081256.1      03013   RNA transport
NM_001085207.2  03013   RNA transport
NM_123131.4     03013   RNA transport
AK227931.1      03013   RNA transport
BT010588.1      03013   RNA transport
NM_001345119.1  03013   RNA transport
NM_124899.4     03013   RNA transport
BT024755.1      03013   RNA transport
NM_125623.3     03013   RNA transport
NM_001126006.1  03013   RNA transport
NM_001126006.1  03013   RNA transport
BT005429.1      03013   RNA transport
NM_001331983.1  03015   mRNA surveillance pathway
NM_001035946.2  03015   mRNA surveillance pathway
NM_179308.4     03015   mRNA surveillance pathway
NM_001331982.1  03015   mRNA surveillance pathway
NM_001331981.1  03015   mRNA surveillance pathway
NM_101013.1     03015   mRNA surveillance pathway
BT005041.1      03015   mRNA surveillance pathway
BT004216.1      03015   mRNA surveillance pathway
NM_001334606.1  03015   mRNA surveillance pathway
NM_106042.3     03015   mRNA surveillance pathway
BT005558.1      03015   mRNA surveillance pathway
NM_127899.4     03015   mRNA surveillance pathway
AY079389.1      03015   mRNA surveillance pathway
NM_112509.2     03015   mRNA surveillance pathway
AX765882.1      03015   mRNA surveillance pathway
NM_117195.5     03015   mRNA surveillance pathway
AY090365.1      03015   mRNA surveillance pathway
NM_001085207.2  03015   mRNA surveillance pathway
NM_123131.4     03015   mRNA surveillance pathway
AK227931.1      03015   mRNA surveillance pathway
BT010588.1      03015   mRNA surveillance pathway
NM_126022.4     03015   mRNA surveillance pathway
NM_180950.3     03015   mRNA surveillance pathway
NM_001203704.1  03015   mRNA surveillance pathway
AK316693.1      03015   mRNA surveillance pathway
AY081317.1      03015   mRNA surveillance pathway
NM_100215.4     03018   RNA degradation
BT025569.1      03018   RNA degradation
NM_127899.4     03018   RNA degradation
AY079389.1      03018   RNA degradation
NM_112509.2     03018   RNA degradation
AX765882.1      03018   RNA degradation
NM_001338747.1  03018   RNA degradation
NM_001338748.1  03018   RNA degradation
NM_001338746.1  03018   RNA degradation
NM_113440.4     03018   RNA degradation
NM_001084738.2  03018   RNA degradation
AK176804.1      03018   RNA degradation
NM_001339242.1  03018   RNA degradation
NM_001035742.3  03018   RNA degradation
NM_001084781.2  03018   RNA degradation
NM_001035740.3  03018   RNA degradation
NM_001203090.1  03018   RNA degradation
AK317537.1      03018   RNA degradation
AK317261.1      03018   RNA degradation
NM_114490.3     03018   RNA degradation
NM_001035741.2  03018   RNA degradation
AK228171.1      03018   RNA degradation
BT003125.1      03018   RNA degradation
NM_001340001.1  03018   RNA degradation
NM_115843.3     03018   RNA degradation
NM_001340000.1  03018   RNA degradation
BT004433.1      03018   RNA degradation
NM_119129.3     03018   RNA degradation
BT008333.1      03018   RNA degradation
NM_113498.3     03020   RNA polymerase
AY084292.1      03020   RNA polymerase
BT024567.1      03020   RNA polymerase
NM_123466.3     03020   RNA polymerase
AY084743.1      03020   RNA polymerase
AY079307.1      03020   RNA polymerase
NM_101692.2     03022   Basal transcription factors
AY085062.1      03022   Basal transcription factors
BT025174.1      03022   Basal transcription factors
NM_001333716.1  03022   Basal transcription factors
NM_001333717.1  03022   Basal transcription factors
NM_104427.4     03022   Basal transcription factors
AB493506.1      03022   Basal transcription factors
NM_179481.2     03022   Basal transcription factors
AK227470.1      03022   Basal transcription factors
AY463626.1      03022   Basal transcription factors
BT006488.1      03022   Basal transcription factors
NM_104451.4     03022   Basal transcription factors
NM_001333727.1  03022   Basal transcription factors
NM_001333726.1  03022   Basal transcription factors
NM_001333729.1  03022   Basal transcription factors
NM_001333728.1  03022   Basal transcription factors
NM_001333725.1  03022   Basal transcription factors
AK226523.1      03022   Basal transcription factors
AK226400.1      03022   Basal transcription factors
NM_116007.5     03022   Basal transcription factors
NM_001340098.1  03022   Basal transcription factors
NM_118219.2     03022   Basal transcription factors
NM_001342109.1  03022   Basal transcription factors
NM_179150.4     03022   Basal transcription factors
NM_119321.4     03022   Basal transcription factors
AK317292.1      03022   Basal transcription factors
AY463628.1      03022   Basal transcription factors
NM_126110.3     03030   DNA replication
NM_180602.2     03040   Spliceosome
NM_001331359.1  03040   Spliceosome
NM_001331358.1  03040   Spliceosome
NM_001331357.1  03040   Spliceosome
NM_180603.1     03040   Spliceosome
BT006316.1      03040   Spliceosome
NM_100215.4     03040   Spliceosome
BT025569.1      03040   Spliceosome
AY096507.1      03040   Spliceosome
AY090343.1      03040   Spliceosome
AY065202.1      03040   Spliceosome
NM_102530.3     03040   Spliceosome
NM_001084140.1  03040   Spliceosome
AF099940.2      03040   Spliceosome
NM_001198307.2  03040   Spliceosome
NM_001333702.1  03040   Spliceosome
NM_001333701.1  03040   Spliceosome
NM_001333699.1  03040   Spliceosome
NM_104406.6     03040   Spliceosome
NM_001333700.1  03040   Spliceosome
NM_001036118.4  03040   Spliceosome
AK318976.1      03040   Spliceosome
BT020420.1      03040   Spliceosome
NM_001084420.1  03040   Spliceosome
AK220634.1      03040   Spliceosome
NM_112203.4     03040   Spliceosome
NM_001339420.1  03040   Spliceosome
NM_001339419.1  03040   Spliceosome
NM_001339417.1  03040   Spliceosome
NM_001339418.1  03040   Spliceosome
NM_114803.6     03040   Spliceosome
NM_001203112.1  03040   Spliceosome
NM_001084795.1  03040   Spliceosome
BT030067.1      03040   Spliceosome
NM_001339619.1  03040   Spliceosome
NM_180684.4     03040   Spliceosome
NM_115210.6     03040   Spliceosome
AK316697.1      03040   Spliceosome
AY095996.1      03040   Spliceosome
NM_115404.6     03040   Spliceosome
AY099649.1      03040   Spliceosome
NM_001340001.1  03040   Spliceosome
NM_115843.3     03040   Spliceosome
NM_001340000.1  03040   Spliceosome
BT004433.1      03040   Spliceosome
NM_001340376.1  03040   Spliceosome
NM_001340377.1  03040   Spliceosome
NM_179206.3     03040   Spliceosome
NM_001340375.1  03040   Spliceosome
NM_179083.3     03040   Spliceosome
NM_118163.4     03040   Spliceosome
NM_001160786.1  03040   Spliceosome
AK317021.1      03040   Spliceosome
NM_001036605.1  03040   Spliceosome
BT005057.1      03040   Spliceosome
BT004219.1      03040   Spliceosome
NM_119168.4     03040   Spliceosome
NM_001203943.1  03040   Spliceosome
AK227757.1      03040   Spliceosome
BT006382.1      03040   Spliceosome
NM_202966.4     03040   Spliceosome
NM_179178.3     03040   Spliceosome
NM_119833.4     03040   Spliceosome
NM_001204008.1  03040   Spliceosome
AY080711.1      03040   Spliceosome
AF462805.1      03040   Spliceosome
NM_001344188.1  03040   Spliceosome
NM_001344187.1  03040   Spliceosome
NM_001344186.1  03040   Spliceosome
NM_180770.2     03040   Spliceosome
NM_001203501.1  03040   Spliceosome
AK318988.1      03040   Spliceosome
AY093216.1      03040   Spliceosome
BT008856.1      03040   Spliceosome
NM_123096.3     03040   Spliceosome
NM_001085207.2  03040   Spliceosome
NM_123131.4     03040   Spliceosome
AK227931.1      03040   Spliceosome
BT010588.1      03040   Spliceosome
NM_123647.3     03040   Spliceosome
NM_203141.2     03040   Spliceosome
NM_001036934.3  03040   Spliceosome
NM_123817.4     03040   Spliceosome
AY072470.1      03040   Spliceosome
AK221574.1      03040   Spliceosome
AK176849.1      03040   Spliceosome
NM_125816.4     03040   Spliceosome
NM_125816.4     03040   Spliceosome
NM_180930.3     03040   Spliceosome
NM_001345648.1  03050   Proteasome
NM_125872.4     03050   Proteasome
NM_001037065.2  03050   Proteasome
AY230833.1      03050   Proteasome
NM_001337791.1  03060   Protein export
NM_001337792.1  03060   Protein export
NM_111732.3     03060   Protein export
NM_001337789.1  03060   Protein export
NM_001337790.1  03060   Protein export
BT025161.1      03060   Protein export
NM_001336913.1  03410   Base excision repair
NM_001336914.1  03410   Base excision repair
NM_129709.5     03410   Base excision repair
NM_001125028.1  03410   Base excision repair
NM_001342397.1  03410   Base excision repair
NM_001342399.1  03410   Base excision repair
NM_001342398.1  03410   Base excision repair
NM_119772.3     03410   Base excision repair
NM_202962.2     03410   Base excision repair
NM_101692.2     03420   Nucleotide excision repair
AY085062.1      03420   Nucleotide excision repair
BT025174.1      03420   Nucleotide excision repair
NM_104451.4     03420   Nucleotide excision repair
NM_001333727.1  03420   Nucleotide excision repair
NM_001333726.1  03420   Nucleotide excision repair
NM_001333729.1  03420   Nucleotide excision repair
NM_001333728.1  03420   Nucleotide excision repair
NM_001333725.1  03420   Nucleotide excision repair
AK226523.1      03420   Nucleotide excision repair
NM_116007.5     03420   Nucleotide excision repair
NM_001340098.1  03420   Nucleotide excision repair
NM_001203727.2  03430   Mismatch repair
NM_116438.2     03430   Mismatch repair
NM_001340379.1  03430   Mismatch repair
NM_001340380.1  03430   Mismatch repair
NM_001340378.1  03430   Mismatch repair
NM_116479.4     03430   Mismatch repair
NM_127507.3     03440   Homologous recombination
BT029745.1      03440   Homologous recombination
NM_130091.2     03440   Homologous recombination
NM_001202820.1  03440   Homologous recombination
NM_111448.3     03440   Homologous recombination
NM_001337605.1  03440   Homologous recombination
NM_001339071.1  03440   Homologous recombination
NM_001339072.1  03440   Homologous recombination
NM_001339070.1  03440   Homologous recombination
NM_001339069.1  03440   Homologous recombination
NM_114061.4     03440   Homologous recombination
NM_125788.7     03440   Homologous recombination
EU295446.1      03440   Homologous recombination
NM_128190.3     04016   MAPK signaling pathway - plant
FJ708701.1      04016   MAPK signaling pathway - plant
NM_116332.4     04016   MAPK signaling pathway - plant
BT025783.1      04016   MAPK signaling pathway - plant
NM_122444.4     04016   MAPK signaling pathway - plant
AK227858.1      04016   MAPK signaling pathway - plant
AJ609239.1      04016   MAPK signaling pathway - plant
AY485830.1      04016   MAPK signaling pathway - plant
NM_124695.4     04016   MAPK signaling pathway - plant
NM_180849.2     04016   MAPK signaling pathway - plant
BT003112.1      04016   MAPK signaling pathway - plant
NM_001331300.1  04075   Plant hormone signal transduction
NM_001197957.2  04075   Plant hormone signal transduction
NM_001331302.1  04075   Plant hormone signal transduction
NM_001331301.1  04075   Plant hormone signal transduction
NM_100057.2     04075   Plant hormone signal transduction
NM_001331411.1  04075   Plant hormone signal transduction
NM_100225.3     04075   Plant hormone signal transduction
BT030604.1      04075   Plant hormone signal transduction
AK176767.1      04075   Plant hormone signal transduction
AK176256.1      04075   Plant hormone signal transduction
NM_100824.3     04075   Plant hormone signal transduction
NM_001331838.1  04075   Plant hormone signal transduction
NM_001331837.1  04075   Plant hormone signal transduction
NM_001331836.1  04075   Plant hormone signal transduction
NM_179295.3     04075   Plant hormone signal transduction
NM_001331839.1  04075   Plant hormone signal transduction
AF251693.1      04075   Plant hormone signal transduction
NM_105536.4     04075   Plant hormone signal transduction
NM_001337007.1  04075   Plant hormone signal transduction
NM_001337008.1  04075   Plant hormone signal transduction
NM_001337009.1  04075   Plant hormone signal transduction
NM_129862.3     04075   Plant hormone signal transduction
AB493588.1      04075   Plant hormone signal transduction
AK316898.1      04075   Plant hormone signal transduction
AJ440755.1      04075   Plant hormone signal transduction
AF251694.1      04075   Plant hormone signal transduction
NM_180050.1     04075   Plant hormone signal transduction
NM_111384.4     04075   Plant hormone signal transduction
NM_116163.4     04075   Plant hormone signal transduction
NM_001340265.1  04075   Plant hormone signal transduction
NM_116296.4     04075   Plant hormone signal transduction
AY093275.1      04075   Plant hormone signal transduction
NM_116332.4     04075   Plant hormone signal transduction
BT025783.1      04075   Plant hormone signal transduction
NM_117987.4     04075   Plant hormone signal transduction
BT026031.1      04075   Plant hormone signal transduction
NM_118554.3     04075   Plant hormone signal transduction
BT005395.1      04075   Plant hormone signal transduction
BT004192.1      04075   Plant hormone signal transduction
NM_119579.3     04075   Plant hormone signal transduction
AK221712.1      04075   Plant hormone signal transduction
NM_122444.4     04075   Plant hormone signal transduction
AK227858.1      04075   Plant hormone signal transduction
AJ609239.1      04075   Plant hormone signal transduction
AY485830.1      04075   Plant hormone signal transduction
NM_124695.4     04075   Plant hormone signal transduction
NM_180849.2     04075   Plant hormone signal transduction
BT003112.1      04075   Plant hormone signal transduction
NM_101307.5     04120   Ubiquitin mediated proteolysis
AY091330.1      04120   Ubiquitin mediated proteolysis
AY070074.1      04120   Ubiquitin mediated proteolysis
NM_202096.2     04120   Ubiquitin mediated proteolysis
AK226391.1      04120   Ubiquitin mediated proteolysis
DQ027016.1      04120   Ubiquitin mediated proteolysis
NM_105097.9     04120   Ubiquitin mediated proteolysis
NM_001198379.1  04120   Ubiquitin mediated proteolysis
NM_001160974.1  04120   Ubiquitin mediated proteolysis
NM_001160973.1  04120   Ubiquitin mediated proteolysis
AF480945.1      04120   Ubiquitin mediated proteolysis
NM_001036151.1  04120   Ubiquitin mediated proteolysis
DQ027041.1      04120   Ubiquitin mediated proteolysis
NM_001335135.1  04120   Ubiquitin mediated proteolysis
NM_001335136.1  04120   Ubiquitin mediated proteolysis
NM_001335134.1  04120   Ubiquitin mediated proteolysis
NM_126331.4     04120   Ubiquitin mediated proteolysis
AY072479.1      04120   Ubiquitin mediated proteolysis
DQ027017.1      04120   Ubiquitin mediated proteolysis
NM_115396.4     04120   Ubiquitin mediated proteolysis
NM_001203167.1  04120   Ubiquitin mediated proteolysis
AK317143.1      04120   Ubiquitin mediated proteolysis
DQ027028.1      04120   Ubiquitin mediated proteolysis
NM_118273.8     04120   Ubiquitin mediated proteolysis
NM_119480.4     04120   Ubiquitin mediated proteolysis
NM_001203971.1  04120   Ubiquitin mediated proteolysis
NM_119481.3     04120   Ubiquitin mediated proteolysis
BT026138.1      04120   Ubiquitin mediated proteolysis
NM_001342801.1  04120   Ubiquitin mediated proteolysis
NM_001342802.1  04120   Ubiquitin mediated proteolysis
NM_120590.3     04120   Ubiquitin mediated proteolysis
NM_001085061.1  04120   Ubiquitin mediated proteolysis
DQ027036.1      04120   Ubiquitin mediated proteolysis
NM_105097.9     04141   Protein processing in endoplasmic reticulum
NM_001198379.1  04141   Protein processing in endoplasmic reticulum
NM_001160974.1  04141   Protein processing in endoplasmic reticulum
NM_001160973.1  04141   Protein processing in endoplasmic reticulum
AF480945.1      04141   Protein processing in endoplasmic reticulum
NM_001036151.1  04141   Protein processing in endoplasmic reticulum
DQ027041.1      04141   Protein processing in endoplasmic reticulum
NM_115396.4     04141   Protein processing in endoplasmic reticulum
NM_001203167.1  04141   Protein processing in endoplasmic reticulum
AK317143.1      04141   Protein processing in endoplasmic reticulum
DQ027028.1      04141   Protein processing in endoplasmic reticulum
NM_102820.3     04144   Endocytosis
AY084256.1      04144   Endocytosis
BT005308.1      04144   Endocytosis
NM_001333920.1  04144   Endocytosis
NM_001333921.1  04144   Endocytosis
NM_104767.4     04144   Endocytosis
NM_128725.3     04144   Endocytosis
AK227705.1      04144   Endocytosis
BT009720.1      04144   Endocytosis
AY091372.1      04145   Phagosome
NM_105148.3     04145   Phagosome
NM_106228.3     04145   Phagosome
NM_128508.3     04145   Phagosome
AY090345.1      04145   Phagosome
NM_119039.3     04145   Phagosome
BT025271.1      04145   Phagosome
NM_001342314.1  04145   Phagosome
NM_001342313.1  04145   Phagosome
NM_100824.3     04712   Circadian rhythm - plant
NM_001331838.1  04712   Circadian rhythm - plant
NM_001331837.1  04712   Circadian rhythm - plant
NM_001331836.1  04712   Circadian rhythm - plant
NM_179295.3     04712   Circadian rhythm - plant
NM_001331839.1  04712   Circadian rhythm - plant
AF251693.1      04712   Circadian rhythm - plant
NM_001335612.1  04712   Circadian rhythm - plant
NM_127435.4     04712   Circadian rhythm - plant
NM_127871.5     04712   Circadian rhythm - plant
AY081478.1      04712   Circadian rhythm - plant
NM_119039.3     04933   AGE-RAGE signaling pathway in diabetic complications
BT025271.1      04933   AGE-RAGE signaling pathway in diabetic complications
NM_001342314.1  04933   AGE-RAGE signaling pathway in diabetic complications
NM_001342313.1  04933   AGE-RAGE signaling pathway in diabetic complications

*/
