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

/*
output

path_description  kegg_path_id  entrez_gene_id  ncbi_gene_id  genomic_id  gene_description  bud_count callus_count  flower_count  leaf_count  root_count  silique_count stem_count  avg_read_count  sd_read_count
Biotin metabolism       00780   AT5G57590       835863  NM_125140.4     Arabidopsis thaliana adenosylmethionine-8-amino-7-oxononanoate transaminase (BIO1)      140     199     62      461     256     245
     136     214.14  118.69700922938202
Biotin metabolism       00780   AT5G46290       834671  NM_123998.3     Arabidopsis thaliana 3-ketoacyl-acyl carrier protein synthase I (KASI)  1594    393     276     1367    328     792     686     776.57  481.6862775707857
Biotin metabolism       00780   AT5G18210       831939  NM_121826.3     Arabidopsis thaliana NAD(P)-binding Rossmann-fold superfamily protein mRNA      2       \N      1       5       8       8       \N
      4.8     2.925747767665559
Biotin metabolism       00780   AT5G10160       830880  NM_121054.5     Arabidopsis thaliana Thioesterase superfamily protein mRNA      523     242     155     345     56      309     188     259.71  139.86904589650993
Biotin metabolism       00780   AT5G04620       830339  NM_203002.4     Arabidopsis thaliana biotin F (BIOF)    219     69      38      145     78      133     40      103.14  61.05603983227213
Biotin metabolism       00780   AT5G04620       830339  NM_001342782.1  Arabidopsis thaliana biotin F (BIOF)    219     69      38      145     78      133     40      103.14  61.05603983227213
Biotin metabolism       00780   AT5G18210       831939  NM_001343539.1  Arabidopsis thaliana NAD(P)-binding Rossmann-fold superfamily protein mRNA      2       \N      1       5       8       8       \N
      4.8     2.925747767665559
Biotin metabolism       00780   AT4G13180       826932  NM_117387.3     Arabidopsis thaliana NAD(P)-binding Rossmann-fold superfamily protein mRNA      \N      36      \N      \N      69      \N      1
       35.33   27.76490590655765
Biotin metabolism       00780   AT3G04000       819555  NM_111271.3     Arabidopsis thaliana NAD(P)-binding Rossmann-fold superfamily protein mRNA      10      24      4       35      \N      76      5
       25.67   25.05114767830009
Biotin metabolism       00780   AT3G03980       819553  NM_111269.2     Arabidopsis thaliana NAD(P)-binding Rossmann-fold superfamily protein mRNA      245     80      78      668     42      143     104
     194.29  202.6726424557592
Biotin metabolism       00780   AT2G43360       818937  NM_129897.4     Arabidopsis thaliana Radical SAM superfamily protein (BIO2)     675     245     172     483     153     579     296     371.86  191.5518728699879
Biotin metabolism       00780   AT2G22230       816756  NM_127789.4     Arabidopsis thaliana Thioesterase superfamily protein mRNA      11      19      14      21      11      9       38      17.57   9.28654941299512
Biotin metabolism       00780   AT2G05990       815152  NM_126612.3     Arabidopsis thaliana NAD(P)-binding Rossmann-fold superfamily protein (MOD1)    1709    418     424     916     194     920     515
     728.0   471.1096369211736
Biotin metabolism       00780   AT2G04540       814996  NM_126485.4     Arabidopsis thaliana Beta-ketoacyl synthase mRNA        110     137     41      300     89      139     79      127.86  77.09072577165168
Biotin metabolism       00780   AT1G74960       843835  NM_106154.4     Arabidopsis thaliana fatty acid biosynthesis 1 (FAB1)   848     459     195     1028    176     594     368     524.0   298.04075224707105
Biotin metabolism       00780   AT1G74960       843835  NM_179557.4     Arabidopsis thaliana fatty acid biosynthesis 1 (FAB1)   863     473     206     1036    176     603     373     532.86  300.0921025285404
Biotin metabolism       00780   AT1G24360       839053  NM_102282.4     Arabidopsis thaliana NAD(P)-binding Rossmann-fold superfamily protein mRNA      1001    427     225     992     337     622     428
     576.0   287.9047411905542
Biotin metabolism       00780   AT5G57590       835863  HQ857557.1      Arabidopsis thaliana bifunctional BIO3-BIO1 mRNA        140     199     62      461     256     245     136     214.14  118.69700922938202
Biotin metabolism       00780   AT5G46290       834671  NM_001203550.1  Arabidopsis thaliana 3-ketoacyl-acyl carrier protein synthase I (KASI)  1594    393     276     1367    328     792     686     776.57  481.6862775707857
Biotin metabolism       00780   AT1G74960       843835  NM_001198471.1  Arabidopsis thaliana fatty acid biosynthesis 1 (FAB1)   856     463     200     1031    176     597     369     527.43  299.1286679674819
Biotin metabolism       00780   AT5G04620       830339  NM_120544.3     Arabidopsis thaliana biotin F (BIOF)    219     69      38      145     78      133     40      103.14  61.05603983227213
Biotin metabolism       00780   AT2G05990       815152  AY113962.1      Arabidopsis thaliana putative enoyl-ACP reductase enr-A (At2g05990) mRNA        1709    418     424     916     194     920     515
     728.0   471.1096369211736
Biotin metabolism       00780   AT2G04540       814996  AY099587.1      Arabidopsis thaliana 3-oxoacyl carrier protein synthase (At2g04540) mRNA        110     137     41      300     89      139     79
      127.86  77.09072577165168
Biotin metabolism       00780   AT4G13180       826932  AY097422.1      Arabidopsis thaliana AT4g13180/F17N18_70 mRNA   \N      36      \N      \N      69      \N      1       35.33   27.76490590655765
Biotin metabolism       00780   AT1G74960       843835  AY097344.1      Arabidopsis thaliana At1g74960/F9E10_19 mRNA    836     455     193     1005    174     575     364     514.57  291.08313245531764
Biotin metabolism       00780   AT2G04540       814996  AB073746.1      Arabidopsis thaliana mtKAS mRNA for 3-ketoacyl-acyl carrier protein synthase    110     137     41      300     89      139     79
      127.86  77.09072577165168
Biotin metabolism       00780   AT5G46290       834671  AY094005.1      Arabidopsis thaliana AT5g46290/MPL12_7 mRNA     1594    392     276     1367    327     791     686     776.14  481.9286980456756
Biotin metabolism       00780   AT1G24360       839053  AY081491.1      Arabidopsis thaliana unknown protein mRNA       1001    427     225     992     337     622     428     576.0   287.9047411905542
Biotin metabolism       00780   AT4G13180       826932  AF446363.1      Arabidopsis thaliana AT4g13180/F17N18_70 mRNA   \N      36      \N      \N      69      \N      1       35.33   27.76490590655765
Biotin metabolism       00780   AT5G04620       830339  NM_120544.3     Arabidopsis thaliana biotin F (BIOF)    219     69      38      145     78      133     40      103.14  61.05603983227213
Biotin metabolism       00780   AT5G57590       835863  EU089963.1      Arabidopsis thaliana mitochondrial bifunctional diaminopelargonate synthase-dethiobiotin synthetase mRNA        140     199     62
      461     256     245     136     214.14  118.69700922938202
Biotin metabolism       00780   AT5G04620       830339  BT026507.1      Arabidopsis thaliana At5g04620 mRNA     202     57      36      137     68      115     36      93.0    56.97113304121658
Biotin metabolism       00780   AT5G10160       830880  AK227658.1      Arabidopsis thaliana mRNA for hypothetical protein      523     242     155     345     56      309     188     259.71  139.86904589650993
Biotin metabolism       00780   AT2G43360       818937  BT024899.1      Arabidopsis thaliana At2g43360 mRNA     675     245     172     483     153     579     296     371.86  191.5518728699879
Biotin metabolism       00780   AT5G46290       834671  NM_001036941.1  Arabidopsis thaliana 3-ketoacyl-acyl carrier protein synthase I (KASI)  1315    365     218     1082    258     655     548     634.43  388.9718498811964
Biotin metabolism       00780   AT5G04620       830339  DQ017966.1      Arabidopsis thaliana 7-keto-8-amino pelargonic acid synthase mRNA       219     69      38      145     78      133     40      103.14  61.05603983227213
*/
