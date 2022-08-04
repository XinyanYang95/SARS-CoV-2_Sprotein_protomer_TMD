# SARS-CoV-2_Sprotein_protomer_TMD

Project name: Targeted Molecular Dynamics Study of SARS-CoV-2 Spike Protein Head Protomer Opening and Closing Transitions

Project type: Research project

Date: 2020-2021

Project description: In this study, we conducted RMSD-based Targeted Molecular Dynamics (TMD) simulations on glycosylated S-protein head protomers to complete the opening and closing transitions in a short simulation time. PCA was performed on the conformations sampled in 50-ns MD simulations, from which the initial and target structures used in TMD runs were generated. PC1 is characterized by the RBD rotating up and down. PC2 captures the NTD-SD1/SD2-RBD pocket closing and drifting. In TMD simulations, each initial structure finally reached the target conformation with an RMSD around 0.5 Å. The path completion was also validated in the 2D PC1-PC2 space. We defined an RBD orientation dihedral to quantify the global movement of RBD in the protomer, which increased or decreased nearly monotonically in the opening and closing transitions, respectively. The intra- and inter-domain salt bridges related to the protomer conformational change were investigated. Also detected were some critical backbone dihedrals reluctant to undergo the transition and remaining in the initial state.

File and script descriptions:
  sys_down - .psf and .pdf files of dried (no water moledules) SARS-CoV-2 Spike Protein protomer A in down state w/ or w/o glycans.
  sys_up - .psf and .pdf files of dried (no water moledules) SARS-CoV-2 Spike Protein protomer A in up state w/ or w/o glycans.
  saved_pkl - pickle files saved by data analysis Jupyter notebooks. Most of them are from processing .dcd trajectory output by NAMD.
  NCA.ipynb - Jupyter notebook for protein Native Contact Analysis (NCA).
  SaltBridges.ipynb - Jupyter notebook for protein salt bridges forming and breaking in the down-to-up/up-to-down transition.
  DihedralDistribution.ipynb - Jupyter notebook for analysing critical dihedral changes in the transitions.
  PCA_PseudoDihedral_RMSD.ipynb - Jupyter notebook for Principal Component Analysis (PCA), pesudo diheral analysis, and Root Mean Squared Deviation (RMSD) analysis.
  GlycanProteinHonds_DomainDistance_PseudoAngle.ipynb - Jupyter notebook for glycan-protein H-bond analysis, NTD-RBD domain distance analysis, and pesudo angle analysis.
  porcupinePC.tcl and readData.tcl - .tcl scripts for plotting porcupine plot (in VMD) with two dominant protein motions calculated by PCA.
  TMDReport_Xinyan_04272021 - a word report of SARS-CoV-2 Spike Protein protomer A down-to-up transition.
  ReportPlots - example plots saved by data analysis Jupyter notebooks.

Other files (protein structure and data) are too large to upload here. They are available per request.
