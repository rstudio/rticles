%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%	MDPI class for LaTeX files	 12-24-2017
%% %%	For any information please send an e-mail to:
%% %%		latex-support@mdpi.com (Dr. Janine Daum) 
%% %%
%% %%	Initial class provided by:
%% %%		Stefano Mariani 
%% %%   Modified by:
%% %%		Dietrich Rordorf 
%% %%		Peter Harremoes 
%% %%		Zeno Schumacher 
%% %%		Maddalena Giulini 
%% %%		Andres Gartmann 
%% %%		Dr. Janine Daum 
%% %%   Versions:
%% %%		v1.0 before Dr. Janine Daum
%% %%		v2.0 when Dr. Janine Daum started (March 2013)
%% %%		v3.0 after layout change (September 2015)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% IDENTIFICATION
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mdpi}[2017/12/24 MDPI paper class]

%%%% Copyright and citebox
 \AtEndDocument{\par \cright \par \vspace{12pt} \citebox}
 
%% PRELIMINARY DECLARATIONS
\LoadClass[10pt]{article}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{calc}
\RequirePackage{indentfirst}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx,epstopdf}
\RequirePackage{lastpage}
\RequirePackage{ifthen}
\RequirePackage{lineno}
\RequirePackage{float}
\RequirePackage{amsmath}
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{mathpazo}
\RequirePackage{booktabs} % For \toprule etc. in tables
\RequirePackage[largestsep]{titlesec}
\RequirePackage{etoolbox} % For \AtBeginDocument etc.
\RequirePackage{tabto} % To use tab for alignment on first page
\RequirePackage{color} % To provide color for soul
\RequirePackage{soul} % To highlight text
\newcommand{\highlight}[1]{\colorbox{yellow}{#1}}
\RequirePackage{multirow}
\RequirePackage{microtype} % For command \textls[]{}
\RequirePackage{tikz} % For Orcid icon
 
%% OPTIONS
%% To choose the journal
\DeclareOption{test}{\gdef\@journal{test}}
\DeclareOption{notspecified}{\gdef\@journal{notspecified}}
\DeclareOption{actuators}{\gdef\@journal{actuators}}
\DeclareOption{addictions}{\gdef\@journal{addictions}}
\DeclareOption{admsci}{\gdef\@journal{admsci}}
\DeclareOption{administrativesciences}{\gdef\@journal{admsci}} %to have backwards compatibility
\DeclareOption{aerospace}{\gdef\@journal{aerospace}}
\DeclareOption{agriculture}{\gdef\@journal{agriculture}}
\DeclareOption{agronomy}{\gdef\@journal{agronomy}}
\DeclareOption{algorithms}{\gdef\@journal{algorithms}}
\DeclareOption{animals}{\gdef\@journal{animals}}
\DeclareOption{antibiotics}{\gdef\@journal{antibiotics}}
\DeclareOption{antibodies}{\gdef\@journal{antibodies}}
\DeclareOption{antioxidants}{\gdef\@journal{antioxidants}}
\DeclareOption{applsci}{\gdef\@journal{applsci}}
\DeclareOption{appliedsciences}{\gdef\@journal{applsci}} %to have backwards compatibility
\DeclareOption{arts}{\gdef\@journal{arts}}
\DeclareOption{asi}{\gdef\@journal{asi}}
\DeclareOption{atmosphere}{\gdef\@journal{atmosphere}}
\DeclareOption{atoms}{\gdef\@journal{atoms}}
\DeclareOption{axioms}{\gdef\@journal{axioms}}
\DeclareOption{batteries}{\gdef\@journal{batteries}}
\DeclareOption{bdcc}{\gdef\@journal{bdcc}}
\DeclareOption{behavsci}{\gdef\@journal{behavsci}} 
\DeclareOption{behavioralsciences}{\gdef\@journal{behavsci}} %to have backwards compatibility 
\DeclareOption{beverages}{\gdef\@journal{beverages}}
\DeclareOption{bioengineering}{\gdef\@journal{bioengineering}}
\DeclareOption{biology}{\gdef\@journal{biology}}
\DeclareOption{biomedicines}{\gdef\@journal{biomedicines}}
\DeclareOption{biomimetics}{\gdef\@journal{biomimetics}}
\DeclareOption{biomolecules}{\gdef\@journal{biomolecules}}
\DeclareOption{biosensors}{\gdef\@journal{biosensors}}
\DeclareOption{brainsci}{\gdef\@journal{brainsci}} 
\DeclareOption{brainsciences}{\gdef\@journal{brainsci}} %to have backwards compatibility 
\DeclareOption{buildings}{\gdef\@journal{buildings}}
\DeclareOption{c}{\gdef\@journal{carbon}}%% for authors
\DeclareOption{carbon}{\gdef\@journal{carbon}} 
\DeclareOption{cancers}{\gdef\@journal{cancers}}
\DeclareOption{catalysts}{\gdef\@journal{catalysts}}
\DeclareOption{cells}{\gdef\@journal{cells}}
\DeclareOption{ceramics}{\gdef\@journal{ceramics}}
\DeclareOption{challenges}{\gdef\@journal{challenges}}
\DeclareOption{chemengineering}{\gdef\@journal{chemengineering}}
\DeclareOption{chemosensors}{\gdef\@journal{chemosensors}}
\DeclareOption{children}{\gdef\@journal{children}}
\DeclareOption{climate}{\gdef\@journal{climate}}
\DeclareOption{coatings}{\gdef\@journal{coatings}}
\DeclareOption{colloids}{\gdef\@journal{colloids}}
\DeclareOption{computation}{\gdef\@journal{computation}}
\DeclareOption{computers}{\gdef\@journal{computers}}
\DeclareOption{condensedmatter}{\gdef\@journal{condensedmatter}}
\DeclareOption{cosmetics}{\gdef\@journal{cosmetics}}
\DeclareOption{cryptography}{\gdef\@journal{cryptography}}
\DeclareOption{crystals}{\gdef\@journal{crystals}}
\DeclareOption{cybersecurity}{\gdef\@journal{cybersecurity}}
\DeclareOption{data}{\gdef\@journal{data}}
\DeclareOption{dentistry}{\gdef\@journal{dentistry}}
\DeclareOption{dentistryjournal}{\gdef\@journal{dentistry}} %to have backwards compatibility 
\DeclareOption{designs}{\gdef\@journal{designs}} 
\DeclareOption{diagnostics}{\gdef\@journal{diagnostics}}
\DeclareOption{diseases}{\gdef\@journal{diseases}}
\DeclareOption{diversity}{\gdef\@journal{diversity}}
\DeclareOption{drones}{\gdef\@journal{drones}}
\DeclareOption{econometrics}{\gdef\@journal{econometrics}}
\DeclareOption{economies}{\gdef\@journal{economies}}
\DeclareOption{education}{\gdef\@journal{education}}
\DeclareOption{educationsciences}{\gdef\@journal{education}} %to have backwards compatibility 
\DeclareOption{electrochemistry}{\gdef\@journal{electrochemistry}}
\DeclareOption{electronics}{\gdef\@journal{electronics}}
\DeclareOption{energies}{\gdef\@journal{energies}}
\DeclareOption{entropy}{\gdef\@journal{entropy}}
\DeclareOption{environments}{\gdef\@journal{environments}}
\DeclareOption{epigenomes}{\gdef\@journal{epigenomes}}
\DeclareOption{est}{\gdef\@journal{est}}
\DeclareOption{fermentation}{\gdef\@journal{fermentation}}
\DeclareOption{fibers}{\gdef\@journal{fibers}}
\DeclareOption{fire}{\gdef\@journal{fire}}
\DeclareOption{fishes}{\gdef\@journal{fishes}}
\DeclareOption{fluids}{\gdef\@journal{fluids}}
\DeclareOption{foods}{\gdef\@journal{foods}}
\DeclareOption{forests}{\gdef\@journal{forests}}
\DeclareOption{fractalfract}{\gdef\@journal{fractalfract}}
\DeclareOption{futureinternet}{\gdef\@journal{futureinternet}}
\DeclareOption{galaxies}{\gdef\@journal{galaxies}}
\DeclareOption{games}{\gdef\@journal{games}}
\DeclareOption{gastrointestdisord}{\gdef\@journal{gastrointestdisord}}
\DeclareOption{gels}{\gdef\@journal{gels}}
\DeclareOption{genealogy}{\gdef\@journal{genealogy}}
\DeclareOption{genes}{\gdef\@journal{genes}}
\DeclareOption{geosciences}{\gdef\@journal{geosciences}}
\DeclareOption{geriatrics}{\gdef\@journal{geriatrics}}
\DeclareOption{hazardousmatters}{\gdef\@journal{hazardousmatters}}
\DeclareOption{healthcare}{\gdef\@journal{healthcare}}
\DeclareOption{heritage}{\gdef\@journal{heritage}}
\DeclareOption{highthroughput}{\gdef\@journal{highthroughput}}
\DeclareOption{horticulturae}{\gdef\@journal{horticulturae}}
\DeclareOption{humanities}{\gdef\@journal{humanities}}
\DeclareOption{hydrology}{\gdef\@journal{hydrology}}
\DeclareOption{informatics}{\gdef\@journal{informatics}}
\DeclareOption{information}{\gdef\@journal{information}}
\DeclareOption{infrastructures}{\gdef\@journal{infrastructures}}
\DeclareOption{inorganics}{\gdef\@journal{inorganics}}
\DeclareOption{insects}{\gdef\@journal{insects}}
\DeclareOption{instruments}{\gdef\@journal{instruments}}
\DeclareOption{ijerph}{\gdef\@journal{ijerph}}
\DeclareOption{ijfs}{\gdef\@journal{ijfs}}
\DeclareOption{ijms}{\gdef\@journal{ijms}}
\DeclareOption{ijgi}{\gdef\@journal{ijgi}}
\DeclareOption{ijtpp}{\gdef\@journal{ijtpp}}
\DeclareOption{inventions}{\gdef\@journal{inventions}}
\DeclareOption{j}{\gdef\@journal{jjournal}}
\DeclareOption{jcdd}{\gdef\@journal{jcdd}}
\DeclareOption{jcm}{\gdef\@journal{jcm}}
\DeclareOption{jcs}{\gdef\@journal{jcs}}
\DeclareOption{jdb}{\gdef\@journal{jdb}}
\DeclareOption{jfb}{\gdef\@journal{jfb}}
\DeclareOption{jfmk}{\gdef\@journal{jfmk}}
\DeclareOption{jof}{\gdef\@journal{jof}}
\DeclareOption{jimaging}{\gdef\@journal{jimaging}}
\DeclareOption{jintelligence}{\gdef\@journal{jintelligence}}
\DeclareOption{jlpea}{\gdef\@journal{jlpea}}
\DeclareOption{jmmp}{\gdef\@journal{jmmp}}
\DeclareOption{jmse}{\gdef\@journal{jmse}}
\DeclareOption{jpm}{\gdef\@journal{jpm}}
\DeclareOption{jrfm}{\gdef\@journal{jrfm}}
\DeclareOption{jsan}{\gdef\@journal{jsan}}
\DeclareOption{land}{\gdef\@journal{land}}
\DeclareOption{languages}{\gdef\@journal{languages}}
\DeclareOption{laws}{\gdef\@journal{laws}}
\DeclareOption{life}{\gdef\@journal{life}}
\DeclareOption{literature}{\gdef\@journal{literature}}
\DeclareOption{logistics}{\gdef\@journal{logistics}}
\DeclareOption{lubricants}{\gdef\@journal{lubricants}}
\DeclareOption{machines}{\gdef\@journal{machines}}
\DeclareOption{magnetochemistry}{\gdef\@journal{magnetochemistry}}
\DeclareOption{make}{\gdef\@journal{make}}
\DeclareOption{marinedrugs}{\gdef\@journal{marinedrugs}}
\DeclareOption{materials}{\gdef\@journal{materials}}
\DeclareOption{mathematics}{\gdef\@journal{mathematics}}
\DeclareOption{mca}{\gdef\@journal{mca}}
\DeclareOption{medsci}{\gdef\@journal{medsci}}
\DeclareOption{medicalsciences}{\gdef\@journal{medsci}} %to have backwards compatibility 
\DeclareOption{medicines}{\gdef\@journal{medicines}}
\DeclareOption{membranes}{\gdef\@journal{membranes}}
\DeclareOption{metabolites}{\gdef\@journal{metabolites}}
\DeclareOption{metals}{\gdef\@journal{metals}}
\DeclareOption{microarrays}{\gdef\@journal{microarrays}}
\DeclareOption{micromachines}{\gdef\@journal{micromachines}}
\DeclareOption{microorganisms}{\gdef\@journal{microorganisms}}
\DeclareOption{minerals}{\gdef\@journal{minerals}}
\DeclareOption{modelling}{\gdef\@journal{modelling}}
\DeclareOption{molbank}{\gdef\@journal{molbank}}
\DeclareOption{molecules}{\gdef\@journal{molecules}}
\DeclareOption{mps}{\gdef\@journal{mps}}
\DeclareOption{mti}{\gdef\@journal{mti}}
\DeclareOption{nanomaterials}{\gdef\@journal{nanomaterials}}
\DeclareOption{ncrna}{\gdef\@journal{ncrna}}
\DeclareOption{neonatalscreening}{\gdef\@journal{neonatalscreening}}
\DeclareOption{neuroglia}{\gdef\@journal{neuroglia}}
\DeclareOption{nitrogen}{\gdef\@journal{nitrogen}}
\DeclareOption{nutrients}{\gdef\@journal{nutrients}}
\DeclareOption{ohbm}{\gdef\@journal{ohbm}}
\DeclareOption{particles}{\gdef\@journal{particles}}
\DeclareOption{pathogens}{\gdef\@journal{pathogens}}
\DeclareOption{pharmaceuticals}{\gdef\@journal{pharmaceuticals}}
\DeclareOption{pharmaceutics}{\gdef\@journal{pharmaceutics}}
\DeclareOption{pharmacy}{\gdef\@journal{pharmacy}}
\DeclareOption{philosophies}{\gdef\@journal{philosophies}}
\DeclareOption{photonics}{\gdef\@journal{photonics}}
\DeclareOption{plants}{\gdef\@journal{plants}}
\DeclareOption{plasma}{\gdef\@journal{plasma}}
\DeclareOption{polymers}{\gdef\@journal{polymers}}
\DeclareOption{polysaccharides}{\gdef\@journal{polysaccharides}}
\DeclareOption{preprints}{\gdef\@journal{preprints}} 
\DeclareOption{proceedings}{\gdef\@journal{proceedings}}
\DeclareOption{processes}{\gdef\@journal{processes}}
\DeclareOption{proteomes}{\gdef\@journal{proteomes}}
\DeclareOption{publications}{\gdef\@journal{publications}}
\DeclareOption{quaternary}{\gdef\@journal{quaternary}}
\DeclareOption{qubs}{\gdef\@journal{qubs}}
\DeclareOption{recycling}{\gdef\@journal{recycling}}
\DeclareOption{religions}{\gdef\@journal{religions}}
\DeclareOption{remotesensing}{\gdef\@journal{remotesensing}}
\DeclareOption{reports}{\gdef\@journal{reports}}
\DeclareOption{resources}{\gdef\@journal{resources}}
\DeclareOption{risks}{\gdef\@journal{risks}}
\DeclareOption{robotics}{\gdef\@journal{robotics}}
\DeclareOption{safety}{\gdef\@journal{safety}}
\DeclareOption{scipharm}{\gdef\@journal{scipharm}}
\DeclareOption{sensors}{\gdef\@journal{sensors}}
\DeclareOption{separations}{\gdef\@journal{separations}}
\DeclareOption{sexes}{\gdef\@journal{sexes}}
\DeclareOption{sinusitis}{\gdef\@journal{sinusitis}}
\DeclareOption{socsci}{\gdef\@journal{socsci}}
\DeclareOption{socialsciences}{\gdef\@journal{socsci}} %to have backwards compatibility 
\DeclareOption{societies}{\gdef\@journal{societies}}
\DeclareOption{soils}{\gdef\@journal{soils}}
\DeclareOption{sports}{\gdef\@journal{sports}}
\DeclareOption{standards}{\gdef\@journal{standards}}
\DeclareOption{stats}{\gdef\@journal{stats}}
\DeclareOption{surgeries}{\gdef\@journal{surgeries}}
\DeclareOption{sustainability}{\gdef\@journal{sustainability}}
\DeclareOption{symmetry}{\gdef\@journal{symmetry}}
\DeclareOption{systems}{\gdef\@journal{systems}}
\DeclareOption{technologies}{\gdef\@journal{technologies}}
\DeclareOption{toxics}{\gdef\@journal{toxics}}
\DeclareOption{toxins}{\gdef\@journal{toxins}}
\DeclareOption{tropicalmed}{\gdef\@journal{tropicalmed}}
\DeclareOption{universe}{\gdef\@journal{universe}}
\DeclareOption{urbansci}{\gdef\@journal{urbansci}}
\DeclareOption{vaccines}{\gdef\@journal{vaccines}}
\DeclareOption{vetsci}{\gdef\@journal{vetsci}}
\DeclareOption{veterinarysciences}{\gdef\@journal{vetsci}} %to have backwards compatibility
\DeclareOption{vibration}{\gdef\@journal{vibration}}
\DeclareOption{viruses}{\gdef\@journal{viruses}}
\DeclareOption{vision}{\gdef\@journal{vision}}
\DeclareOption{water}{\gdef\@journal{water}}
\DeclareOption{wem}{\gdef\@journal{wem}}

%% Uppercase will have the same effect
\DeclareOption{Actuators}{\gdef\@journal{actuators}}
\DeclareOption{Addictions}{\gdef\@journal{addictions}}
\DeclareOption{Admsci}{\gdef\@journal{admsci}}
\DeclareOption{Administrativesciences}{\gdef\@journal{admsci}} %to have backwards compatibility
\DeclareOption{Aerospace}{\gdef\@journal{aerospace}}
\DeclareOption{Agriculture}{\gdef\@journal{agriculture}}
\DeclareOption{Agronomy}{\gdef\@journal{agronomy}}
\DeclareOption{Algorithms}{\gdef\@journal{algorithms}}
\DeclareOption{Animals}{\gdef\@journal{animals}}
\DeclareOption{Antibiotics}{\gdef\@journal{antibiotics}}
\DeclareOption{Antibodies}{\gdef\@journal{antibodies}}
\DeclareOption{Antioxidants}{\gdef\@journal{antioxidants}}
\DeclareOption{Applsci}{\gdef\@journal{applsci}}
\DeclareOption{Appliedsciences}{\gdef\@journal{applsci}} %to have backwards compatibility
\DeclareOption{Arts}{\gdef\@journal{arts}}
\DeclareOption{ASI}{\gdef\@journal{asi}}
\DeclareOption{Atmosphere}{\gdef\@journal{atmosphere}}
\DeclareOption{Atoms}{\gdef\@journal{atoms}}
\DeclareOption{Axioms}{\gdef\@journal{axioms}}
\DeclareOption{Batteries}{\gdef\@journal{batteries}}
\DeclareOption{BDCC}{\gdef\@journal{bdcc}}
\DeclareOption{Behavsci}{\gdef\@journal{behavsci}}
\DeclareOption{Behavioralsciences}{\gdef\@journal{behavsci}} %to have backwards compatibility
\DeclareOption{Beverages}{\gdef\@journal{beverages}}
\DeclareOption{Bioengineering}{\gdef\@journal{bioengineering}}
\DeclareOption{Biology}{\gdef\@journal{biology}}
\DeclareOption{Biomedicines}{\gdef\@journal{biomedicines}}
\DeclareOption{Biomimetics}{\gdef\@journal{biomimetics}}
\DeclareOption{Biomolecules}{\gdef\@journal{biomolecules}}
\DeclareOption{Biosensors}{\gdef\@journal{biosensors}}
\DeclareOption{Brainsci}{\gdef\@journal{brainsci}}
\DeclareOption{Brainsciences}{\gdef\@journal{brainsci}} %to have backwards compatibility
\DeclareOption{Buildings}{\gdef\@journal{buildings}}
\DeclareOption{C}{\gdef\@journal{carbon}}
\DeclareOption{Carbon}{\gdef\@journal{carbon}}
\DeclareOption{Cancers}{\gdef\@journal{cancers}}
\DeclareOption{Catalysts}{\gdef\@journal{catalysts}}
\DeclareOption{Cells}{\gdef\@journal{cells}}
\DeclareOption{Ceramics}{\gdef\@journal{ceramics}}
\DeclareOption{Challenges}{\gdef\@journal{challenges}}
\DeclareOption{ChemEngineering}{\gdef\@journal{chemengineering}}
\DeclareOption{Chemosensors}{\gdef\@journal{chemosensors}}
\DeclareOption{Children}{\gdef\@journal{children}}
\DeclareOption{Climate}{\gdef\@journal{climate}}
\DeclareOption{Coatings}{\gdef\@journal{coatings}}
\DeclareOption{Colloids}{\gdef\@journal{colloids}}
\DeclareOption{Computation}{\gdef\@journal{computation}}
\DeclareOption{Computers}{\gdef\@journal{computers}}
\DeclareOption{Condensedmatter}{\gdef\@journal{condensedmatter}}
\DeclareOption{Cosmetics}{\gdef\@journal{cosmetics}}
\DeclareOption{Cryptography}{\gdef\@journal{cryptography}}
\DeclareOption{Crystals}{\gdef\@journal{crystals}}
\DeclareOption{Cybersecurity}{\gdef\@journal{cybersecurity}}
\DeclareOption{Data}{\gdef\@journal{data}}
\DeclareOption{Dentistry}{\gdef\@journal{dentistry}}
\DeclareOption{Dentistryjournal}{\gdef\@journal{dentistry}} %to have backwards compatibility 
\DeclareOption{Designs}{\gdef\@journal{designs}}
\DeclareOption{Diagnostics}{\gdef\@journal{diagnostics}}
\DeclareOption{Diseases}{\gdef\@journal{diseases}}
\DeclareOption{Diversity}{\gdef\@journal{diversity}}
\DeclareOption{Drones}{\gdef\@journal{drones}}
\DeclareOption{Econometrics}{\gdef\@journal{econometrics}}
\DeclareOption{Economies}{\gdef\@journal{economies}}
\DeclareOption{Education}{\gdef\@journal{education}}
\DeclareOption{Educationsciences}{\gdef\@journal{education}} %to have backwards compatibility
\DeclareOption{Electrochemistry}{\gdef\@journal{electrochemistry}}
\DeclareOption{Electronics}{\gdef\@journal{electronics}}
\DeclareOption{Energies}{\gdef\@journal{energies}}
\DeclareOption{Entropy}{\gdef\@journal{entropy}}
\DeclareOption{Environments}{\gdef\@journal{environments}}
\DeclareOption{Epigenomes}{\gdef\@journal{epigenomes}}
\DeclareOption{EST}{\gdef\@journal{est}}
\DeclareOption{Fermentation}{\gdef\@journal{fermentation}}
\DeclareOption{Fibers}{\gdef\@journal{fibers}}
\DeclareOption{Fire}{\gdef\@journal{fire}}
\DeclareOption{Fishes}{\gdef\@journal{fishes}}
\DeclareOption{Fluids}{\gdef\@journal{fluids}}
\DeclareOption{Foods}{\gdef\@journal{foods}}
\DeclareOption{Forests}{\gdef\@journal{forests}}
\DeclareOption{Fractalfract}{\gdef\@journal{fractalfract}}
\DeclareOption{Futureinternet}{\gdef\@journal{futureinternet}}
\DeclareOption{Galaxies}{\gdef\@journal{galaxies}}
\DeclareOption{Games}{\gdef\@journal{games}}
\DeclareOption{Gastrointestdisord}{\gdef\@journal{gastrointestdisord}}
\DeclareOption{Gels}{\gdef\@journal{gels}}
\DeclareOption{Genealogy}{\gdef\@journal{genealogy}}
\DeclareOption{Genes}{\gdef\@journal{genes}}
\DeclareOption{Geosciences}{\gdef\@journal{geosciences}}
\DeclareOption{Geriatrics}{\gdef\@journal{geriatrics}}
\DeclareOption{Hazardousmatters}{\gdef\@journal{hazardousmatters}}
\DeclareOption{Healthcare}{\gdef\@journal{healthcare}}
\DeclareOption{Heritage}{\gdef\@journal{heritage}}
\DeclareOption{Highthroughput}{\gdef\@journal{highthroughput}}
\DeclareOption{Horticulturae}{\gdef\@journal{horticulturae}}
\DeclareOption{Humanities}{\gdef\@journal{humanities}}
\DeclareOption{Hydrology}{\gdef\@journal{hydrology}}
\DeclareOption{Informatics}{\gdef\@journal{informatics}}
\DeclareOption{Information}{\gdef\@journal{information}}
\DeclareOption{Infrastructures}{\gdef\@journal{infrastructures}}
\DeclareOption{Inorganics}{\gdef\@journal{inorganics}}
\DeclareOption{Insects}{\gdef\@journal{insects}}
\DeclareOption{Instruments}{\gdef\@journal{instruments}}
\DeclareOption{Ijerph}{\gdef\@journal{ijerph}}
\DeclareOption{Ijfs}{\gdef\@journal{ijfs}}
\DeclareOption{Ijms}{\gdef\@journal{ijms}}
\DeclareOption{Ijgi}{\gdef\@journal{ijgi}}
\DeclareOption{Ijtpp}{\gdef\@journal{ijtpp}}
\DeclareOption{Inventions}{\gdef\@journal{inventions}}
\DeclareOption{J}{\gdef\@journal{jjournal}}
\DeclareOption{Jcdd}{\gdef\@journal{jcdd}}
\DeclareOption{Jcm}{\gdef\@journal{jcm}}
\DeclareOption{Jcs}{\gdef\@journal{jcs}}
\DeclareOption{Jdb}{\gdef\@journal{jdb}}
\DeclareOption{Jfb}{\gdef\@journal{jfb}}
\DeclareOption{Jmk}{\gdef\@journal{jfmk}}
\DeclareOption{Jof}{\gdef\@journal{jof}}
\DeclareOption{Jimaging}{\gdef\@journal{jimaging}}
\DeclareOption{Jintelligence}{\gdef\@journal{jintelligence}}
\DeclareOption{Jlpea}{\gdef\@journal{jlpea}}
\DeclareOption{Jmmp}{\gdef\@journal{jmmp}}
\DeclareOption{Jmse}{\gdef\@journal{jmse}}
\DeclareOption{Jpm}{\gdef\@journal{jpm}}
\DeclareOption{Jrfm}{\gdef\@journal{jrfm}}
\DeclareOption{Jsan}{\gdef\@journal{jsan}}
\DeclareOption{Land}{\gdef\@journal{land}}
\DeclareOption{Languages}{\gdef\@journal{languages}}
\DeclareOption{Laws}{\gdef\@journal{laws}}
\DeclareOption{Life}{\gdef\@journal{life}}
\DeclareOption{Literature}{\gdef\@journal{literature}}
\DeclareOption{Logistics}{\gdef\@journal{logistics}}
\DeclareOption{Lubricants}{\gdef\@journal{lubricants}}
\DeclareOption{Machines}{\gdef\@journal{machines}}
\DeclareOption{Magnetochemistry}{\gdef\@journal{magnetochemistry}}
\DeclareOption{Make}{\gdef\@journal{make}}
\DeclareOption{MarineDrugs}{\gdef\@journal{marinedrugs}}
\DeclareOption{Materials}{\gdef\@journal{materials}}
\DeclareOption{Mathematics}{\gdef\@journal{mathematics}}
\DeclareOption{Mca}{\gdef\@journal{mca}}
\DeclareOption{Medsci}{\gdef\@journal{medsci}}
\DeclareOption{Medicalsciences}{\gdef\@journal{medsci}} %to have backwards compatibility
\DeclareOption{Medicines}{\gdef\@journal{medicines}}
\DeclareOption{Membranes}{\gdef\@journal{membranes}}
\DeclareOption{Metabolites}{\gdef\@journal{metabolites}}
\DeclareOption{Metals}{\gdef\@journal{metals}}
\DeclareOption{Microarrays}{\gdef\@journal{microarrays}}
\DeclareOption{Micromachines}{\gdef\@journal{micromachines}}
\DeclareOption{Microorganisms}{\gdef\@journal{microorganisms}}
\DeclareOption{Minerals}{\gdef\@journal{minerals}}
\DeclareOption{Modelling}{\gdef\@journal{modelling}}
\DeclareOption{Molbank}{\gdef\@journal{molbank}}
\DeclareOption{Molecules}{\gdef\@journal{molecules}}
\DeclareOption{Mps}{\gdef\@journal{mps}}
\DeclareOption{Mti}{\gdef\@journal{mti}}
\DeclareOption{Nanomaterials}{\gdef\@journal{nanomaterials}}
\DeclareOption{ncRNA}{\gdef\@journal{ncrna}}
\DeclareOption{Neonatalscreening}{\gdef\@journal{neonatalscreening}}
\DeclareOption{Neuroglia}{\gdef\@journal{neuroglia}}
\DeclareOption{Nitrogen}{\gdef\@journal{nitrogen}}
\DeclareOption{Nutrients}{\gdef\@journal{nutrients}}
\DeclareOption{OHBM}{\gdef\@journal{ohbm}}
\DeclareOption{Particles}{\gdef\@journal{particles}}
\DeclareOption{Pathogens}{\gdef\@journal{pathogens}}
\DeclareOption{Pharmaceuticals}{\gdef\@journal{pharmaceuticals}}
\DeclareOption{Pharmaceutics}{\gdef\@journal{pharmaceutics}}
\DeclareOption{Pharmacy}{\gdef\@journal{pharmacy}}
\DeclareOption{Philosophies}{\gdef\@journal{philosophies}}
\DeclareOption{Photonics}{\gdef\@journal{photonics}}
\DeclareOption{Plants}{\gdef\@journal{plants}}
\DeclareOption{Plasma}{\gdef\@journal{plasma}}
\DeclareOption{Polymers}{\gdef\@journal{polymers}}
\DeclareOption{Polysaccharides}{\gdef\@journal{polysaccharides}}
\DeclareOption{Proceedings}{\gdef\@journal{proceedings}}
\DeclareOption{Processes}{\gdef\@journal{processes}}
\DeclareOption{Proteomes}{\gdef\@journal{proteomes}}
\DeclareOption{Publications}{\gdef\@journal{publications}}
\DeclareOption{Quaternary}{\gdef\@journal{quaternary}}
\DeclareOption{Qubs}{\gdef\@journal{qubs}}
\DeclareOption{Recycling}{\gdef\@journal{recycling}}
\DeclareOption{Religions}{\gdef\@journal{religions}}
\DeclareOption{RemoteSensing}{\gdef\@journal{remotesensing}}
\DeclareOption{Reports}{\gdef\@journal{reports}}
\DeclareOption{Resources}{\gdef\@journal{resources}}
\DeclareOption{Risks}{\gdef\@journal{risks}}
\DeclareOption{Robotics}{\gdef\@journal{robotics}}
\DeclareOption{Safety}{\gdef\@journal{safety}}
\DeclareOption{Scipharm}{\gdef\@journal{scipharm}}
\DeclareOption{Sensors}{\gdef\@journal{sensors}}
\DeclareOption{Separations}{\gdef\@journal{separations}}
\DeclareOption{Sexes}{\gdef\@journal{sexes}}
\DeclareOption{Sinusitis}{\gdef\@journal{sinusitis}}
\DeclareOption{Socsci}{\gdef\@journal{socsci}}
\DeclareOption{SocialSciences}{\gdef\@journal{socsci}} %to have backwards compatibility
\DeclareOption{Societies}{\gdef\@journal{societies}}
\DeclareOption{Soils}{\gdef\@journal{soils}}
\DeclareOption{Sports}{\gdef\@journal{sports}}
\DeclareOption{Standards}{\gdef\@journal{standards}}
\DeclareOption{Stats}{\gdef\@journal{stats}}
\DeclareOption{Surgeries}{\gdef\@journal{surgeries}}
\DeclareOption{Sustainability}{\gdef\@journal{sustainability}}
\DeclareOption{Symmetry}{\gdef\@journal{symmetry}}
\DeclareOption{Systems}{\gdef\@journal{systems}}
\DeclareOption{Technologies}{\gdef\@journal{technologies}}
\DeclareOption{Toxics}{\gdef\@journal{toxics}}
\DeclareOption{Toxins}{\gdef\@journal{toxins}}
\DeclareOption{Tropicalmed}{\gdef\@journal{tropicalmed}}
\DeclareOption{Universe}{\gdef\@journal{universe}}
\DeclareOption{Urbansci}{\gdef\@journal{urbansci}}
\DeclareOption{Vaccines}{\gdef\@journal{vaccines}}
\DeclareOption{Vetsci}{\gdef\@journal{vetsci}}
\DeclareOption{VeterinarySciences}{\gdef\@journal{vetsci}} %to have backwards compatibility
\DeclareOption{Vibration}{\gdef\@journal{vibration}}
\DeclareOption{Viruses}{\gdef\@journal{viruses}}
\DeclareOption{Vision}{\gdef\@journal{vision}}
\DeclareOption{Water}{\gdef\@journal{water}}
\DeclareOption{Wem}{\gdef\@journal{wem}}
\DeclareOption{journal}{\ClassWarning{mdpi}{You have not specified the journal. The first class option of the document class mdpi specifies the journal. The word journal should be replaced by one of the following journal names: actuators, addictions, admsci, aerospace, agriculture, agronomy, algorithms, animals, antibiotics, antibodies, antioxidants, applsci, arts, asi, atmosphere, atoms, axioms, batteries, bdcc, behavsci, beverages, bioengineering, biology, biomedicines, biomimetics, biomolecules, biosensors, brainsci, buildings, carbon, cancers, catalysts, cells, ceramics, challenges, chemengineering, chemosensors, children, climate, coatings, colloids, computation, computers, condensedmatter, cosmetics, cryptography, crystals, cybersecurity, data, dentistry, designs, diagnostics, diseases, diversity, drones, econometrics, economies, education, electrochemistry, electronics, energies, entropy, environments, epigenomes, est, fermentation, fibers, fire, fishes, fluids, foods, forests, fractalfract, futureinternet, galaxies, games, gastrointestdisord, gels, genealogy, genes, geosciences, geriatrics, hazardousmatters, healthcare, heritage, highthroughput, horticulturae, humanities, hydrology, informatics, information, infrastructures, inorganics, insects, instruments, ijerph, ijfs, ijms, ijgi, ijtpp, inventions, j, jcdd, jcm, jcs, jdb, jfb, jfmk, jimaging, jof, jintelligence, jlpea, jmmp, jmse, jpm, jrfm, jsan, land, languages, laws, life, literature, logistics, lubricants, machines, magnetochemistry, make, marinedrugs, materials, mathematics, mca, medsci, medicines, membranes, metabolites, metals, microarrays, micromachines, microorganisms, minerals, modelling, molbank, molecules, mps, mti, nanomaterials, ncrna, neonatalscreening, neuroglia, nitrogen, nutrients, ohbm, particles, pathogens, pharmaceuticals, pharmaceutics, pharmacy, philosophies, photonics, plants, plasma, polymers, polysaccharides, proceedings, processes, proteomes, publications, quaternary, qubs, recycling, religions, remotesensing, reports, resources, risks, robotics, safety, scipharm, sensors, separations, sexes, sinusitis, socsci, societies, soils, sports, standards, stats, surgeries, sustainability, symmetry, systems, technologies, toxics, toxins, tropicalmed, universe, urbansci, vaccines, vetsci, vibration, viruses, vision, water,wem}} 

%% To choose the type of manuscript
\DeclareOption{abstract}{\gdef\@arttype{Abstract}}
\DeclareOption{addendum}{\gdef\@arttype{Addendum}}
\DeclareOption{article}{\gdef\@arttype{Article}}
\DeclareOption{benchmark}{\gdef\@arttype{Benchmark}}
\DeclareOption{book}{\gdef\@arttype{Book}}
\DeclareOption{bookreview}{\gdef\@arttype{Book Review}}
\DeclareOption{briefreport}{\gdef\@arttype{Brief Report}}
\DeclareOption{casereport}{\gdef\@arttype{Case Report}}
\DeclareOption{changes}{\gdef\@arttype{Changes}}
\DeclareOption{comment}{\gdef\@arttype{Comment}}
\DeclareOption{commentary}{\gdef\@arttype{Commentary}}
\DeclareOption{communication}{\gdef\@arttype{Communication}}
\DeclareOption{conceptpaper}{\gdef\@arttype{Concept Paper}}
\DeclareOption{conferenceproceedings}{\gdef\@arttype{Proceedings}}
\DeclareOption{correction}{\gdef\@arttype{Correction}}
\DeclareOption{conferencereport}{\gdef\@arttype{Conference Report}}
\DeclareOption{expressionofconcern}{\gdef\@arttype{Expression of Concern}}
\DeclareOption{meetingreport}{\gdef\@arttype{Meeting Report}}
\DeclareOption{creative}{\gdef\@arttype{Creative}}
\DeclareOption{datadescriptor}{\gdef\@arttype{Data Descriptor}}
\DeclareOption{discussion}{\gdef\@arttype{Discussion}}
\DeclareOption{editorial}{\gdef\@arttype{Editorial}}
\DeclareOption{essay}{\gdef\@arttype{Essay}}
\DeclareOption{erratum}{\gdef\@arttype{Erratum}}
\DeclareOption{hypothesis}{\gdef\@arttype{Hypothesis}}
\DeclareOption{interestingimages}{\gdef\@arttype{Interesting Images}}
\DeclareOption{letter}{\gdef\@arttype{Letter}}
\DeclareOption{meetingreport}{\gdef\@arttype{Meeting Report}}
\DeclareOption{newbookreceived}{\gdef\@arttype{New Book Received}}
\DeclareOption{obituary}{\gdef\@arttype{Obituary}}
\DeclareOption{opinion}{\gdef\@arttype{Opinion}}
\DeclareOption{projectreport}{\gdef\@arttype{Project Report}}
\DeclareOption{reply}{\gdef\@arttype{Reply}}
\DeclareOption{reprint}{\gdef\@arttype{Reprint}}
\DeclareOption{retraction}{\gdef\@arttype{Retraction}}
\DeclareOption{review}{\gdef\@arttype{Review}}
\DeclareOption{perspective}{\gdef\@arttype{Perspective}} 
\DeclareOption{protocol}{\gdef\@arttype{Protocol}} 
\DeclareOption{shortnote}{\gdef\@arttype{Short Note}}
\DeclareOption{supfile}{\gdef\@arttype{Supfile}}
\DeclareOption{technicalnote}{\gdef\@arttype{Technical Note}}
\DeclareOption{viewpoint}{\gdef\@arttype{Viewpoint}}

%% To choose the status of the manuscript
\DeclareOption{submit}{\gdef\@status{submit}}
\DeclareOption{accept}{\gdef\@status{accept}}

%% To choose the whether there is one or more authors
\DeclareOption{oneauthor}{\gdef\@authornum{author}}
\DeclareOption{moreauthors}{\gdef\@authornum{authors}}

%% Add the chosen options to the class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%% Defaults
\ExecuteOptions{notspecified,10pt,a4paper,article,submit,oneauthor}

%% Process options
\ProcessOptions\relax

%% MORE DECLARATIONS
%%%% Maths environments
\RequirePackage{amsthm}
\newtheoremstyle{mdpi}% name
{12pt}% space above
{12pt}% space below
{\itshape}% body font
{}% indent amount 1
{\bfseries}% theorem head font
{.}% punctuation after theorem head
{.5em}% space after theorem head
{}% theorem head spec (can be left empty, meaning `normal')

\renewcommand{\qed}{\unskip\nobreak\quad\qedsymbol} %% This places the symbol right after the text instead of placing it at the end on the line.

\renewenvironment{proof}[1][\proofname]{\par %% \proofname allows to have "Proof of my theorem"
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries %% "Proof" is bold
    #1\@addpunct{.}]\ignorespaces %% Period instead of colon
}{%
  \popQED\endtrivlist\@endpefalse
}

 \theoremstyle{mdpi}
 \newcounter{theorem}
 \setcounter{theorem}{0}
 \newtheorem{Theorem}[theorem]{Theorem}
 
 \newcounter{lemma}
 \setcounter{lemma}{0}
 \newtheorem{Lemma}[lemma]{Lemma}
 
 \newcounter{corollary}
 \setcounter{corollary}{0}
 \newtheorem{Corollary}[corollary]{Corollary}
 
 \newcounter{proposition}
 \setcounter{proposition}{0}
 \newtheorem{Proposition}[proposition]{Proposition}
 
 \newcounter{characterization}
 \setcounter{characterization}{0}
 \newtheorem{Characterization}[characterization]{Characterization}
 
 \newcounter{property}
 \setcounter{property}{0}
 \newtheorem{Property}[property]{Property}
 
 \newcounter{problem}
 \setcounter{problem}{0}
 \newtheorem{Problem}[problem]{Problem}
 
 \newcounter{example}
 \setcounter{example}{0}
 \newtheorem{Example}[example]{Example}
 
 \newcounter{examplesanddefinitions}
 \setcounter{examplesanddefinitions}{0}
 \newtheorem{ExamplesandDefinitions}[examplesanddefinitions]{Examples and Definitions}
 
 \newcounter{remark}
 \setcounter{remark}{0}
 \newtheorem{Remark}[remark]{Remark}
 
 \newcounter{definition}
 \setcounter{definition}{0}
 \newtheorem{Definition}[definition]{Definition}
 
 \newcounter{hypothesis}
 \setcounter{hypothesis}{0}
 \newtheorem{Hypothesis}[hypothesis]{Hypothesis}

 \newcounter{notation}
 \setcounter{notation}{0}
 \newtheorem{Notation}[notation]{Notation}
 
%%%% Hyphenation
\RequirePackage[none]{hyphenat}
\sloppy

%%%% References
\RequirePackage[sort&compress]{natbib}

\ifthenelse{\equal{\@journal}{admsci}
\OR \equal{\@journal}{arts}
\OR \equal{\@journal}{econometrics}
\OR \equal{\@journal}{economies}
\OR \equal{\@journal}{genealogy}
\OR \equal{\@journal}{humanities}
\OR \equal{\@journal}{ijfs}
\OR \equal{\@journal}{jrfm}
\OR \equal{\@journal}{languages}
\OR \equal{\@journal}{laws}
\OR \equal{\@journal}{religions}
\OR \equal{\@journal}{risks}
\OR \equal{\@journal}{socsci}}{%
	\bibliographystyle{chicago2}
	\bibpunct{(}{)}{;}{x}{}{}%
	}{%
	\bibliographystyle{mdpi}
	\bibpunct{[}{]}{,}{n}{}{}%
	}%

\renewcommand\NAT@set@cites{%
  \ifNAT@numbers
    \ifNAT@super \let\@cite\NAT@citesuper
       \def\NAT@mbox##1{\unskip\nobreak\textsuperscript{##1}}%
       \let\citeyearpar=\citeyear
       \let\NAT@space\relax
       \def\NAT@super@kern{\kern\p@}%
    \else
       \let\NAT@mbox=\mbox
       \let\@cite\NAT@citenum
       \let\NAT@space\relax
       \let\NAT@super@kern\relax
    \fi
    \let\@citex\NAT@citexnum
    \let\@biblabel\NAT@biblabelnum
    \let\@bibsetup\NAT@bibsetnum
    \renewcommand\NAT@idxtxt{\NAT@name\NAT@spacechar\NAT@open\NAT@num\NAT@close}%
    \def\natexlab##1{}%
    \def\NAT@penalty{\penalty\@m}%
  \else
    \let\@cite\NAT@cite
    \let\@citex\NAT@citex
    \let\@biblabel\NAT@biblabel
    \let\@bibsetup\NAT@bibsetup
    \let\NAT@space\NAT@spacechar
    \let\NAT@penalty\@empty
    \renewcommand\NAT@idxtxt{\NAT@name\NAT@spacechar\NAT@open\NAT@date\NAT@close}%
    \def\natexlab##1{##1}%
  \fi}

%%%%% Hyperlinks
%% Define color for citations
\definecolor{bluecite}{HTML}{0875b7}

\ifthenelse{\equal{\@arttype}{Reprint} \OR \equal{\@arttype}{Book}}{
	\RequirePackage[unicode=true,
	bookmarksopen={true},
	pdffitwindow=true, 
	colorlinks=true, 
	linkcolor=black, 
	citecolor=black, 
	urlcolor=black, 
	hyperfootnotes=false, 
	pdfstartview={FitH},
	pdfpagemode=UseNone]{hyperref}
	}{
	\RequirePackage[unicode=true,
	bookmarksopen={true},
	pdffitwindow=true, 
	colorlinks=true, 
	linkcolor=bluecite, 
	citecolor=bluecite, 
	urlcolor=bluecite, 
	hyperfootnotes=false, 
	pdfstartview={FitH},
	pdfpagemode= UseNone]{hyperref}
} 

%% To have the possibility to change the urlcolor
\newcommand{\changeurlcolor}[1]{\hypersetup{urlcolor=#1}} 

%% Metadata
\newcommand{\org@maketitle}{}% LATEX-Check
\let\org@maketitle\maketitle
\def\maketitle{%
	\hypersetup{
		pdftitle={\@Title},
		pdfsubject={\@abstract},
		pdfkeywords={\@keyword},
		pdfauthor={\@AuthorNames}
		}%
	\org@maketitle
}

%%%% Footnotes
\RequirePackage[hang]{footmisc}
\setlength{\skip\footins}{1.2cm}
\setlength{\footnotemargin}{5mm}
\def\footnoterule{\kern-14\p@
\hrule \@width 2in \kern 11.6\p@}

%%%% URL
\RequirePackage{url}
\urlstyle{same}
\g@addto@macro{\UrlBreaks}{\UrlOrds} 

%%%% Widows & orphans
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000

%%%% Front matter
\newcommand{\firstargument}{}
\newcommand{\Title}[1]{\gdef\@Title{#1}}%
\newcommand{\Author}[1]{\gdef\@Author{#1}}%
\def\@AuthorNames{}
\newcommand{\AuthorNames}[1]{\gdef\@AuthorNames{#1}}%
\newcommand{\firstpage}[1]{\gdef\@firstpage{#1}}
\newcommand{\doinum}[1]{\gdef\@doinum{#1}}
\newcommand{\pubvolume}[1]{\gdef\@pubvolume{#1}}
\newcommand{\pubyear}[1]{\gdef\@pubyear{#1}}
\newcommand{\copyrightyear}[1]{\gdef\@copyrightyear{#1}}
\newcommand{\address}[2][]{\renewcommand{\firstargument}{#1}\gdef\@address{#2}}
\newcommand{\corresfirstargument}{}
\def\@corres{}
\newcommand{\corres}[2][]{\renewcommand{\corresfirstargument}{#1}\gdef\@corres{#2}} 
\def\@conference{}
\newcommand{\conference}[1]{\gdef\@conference{#1}}%
\def\@abstract{}
\renewcommand{\abstract}[1]{\gdef\@abstract{#1}}
\def\@externaleditor{}
\newcommand{\externaleditor}[1]{\gdef\@externaleditor{#1}}
\newcommand{\history}[1]{\gdef\@history{#1}} 
\def\@pacs{}
\newcommand{\PACS}[1]{\gdef\@pacs{#1}} 
\def\@msc{}
\newcommand{\MSC}[1]{\gdef\@msc{#1}} 
\def\@jel{}
\newcommand{\JEL}[1]{\gdef\@jel{#1}}
\def\@keyword{}
\newcommand{\keyword}[1]{\gdef\@keyword{#1}}
\def\@dataset{}
\newcommand{\dataset}[1]{\gdef\@dataset{#1}}
\def\@datasetlicense{}
\newcommand{\datasetlicense}[1]{\gdef\@datasetlicense{#1}}
\def\@featuredapplication{}
\newcommand{\featuredapplication}[1]{\gdef\@featuredapplication{#1}}
\def\@keycontribution{}
\newcommand{\keycontribution}[1]{\gdef\@keycontribution{#1}}


\def\@firstnote{}
\newcommand{\firstnote}[1]{\gdef\@firstnote{#1}}
\def\@secondnote{}
\newcommand{\secondnote}[1]{\gdef\@secondnote{#1}}%
\def\@thirdnote{}
\newcommand{\thirdnote}[1]{\gdef\@thirdnote{#1}}%
\def\@fourthnote{}
\newcommand{\fourthnote}[1]{\gdef\@fourthnote{#1}}%
\def\@fifthnote{}
\newcommand{\fifthnote}[1]{\gdef\@fifthnote{#1}}%
\def\@sixthnote{}
\newcommand{\sixthnote}[1]{\gdef\@sixthnote{#1}}%
\def\@seventhnote{}
\newcommand{\seventhnote}[1]{\gdef\@seventhnote{#1}}%
\def\@eighthnote{}
\newcommand{\eighthnote}[1]{\gdef\@eighthnote{#1}}%

\def\@simplesumm{}
\newcommand{\simplesumm}[1]{\gdef\@simplesumm{#1}}
\newcommand{\articlenumber}[1]{\gdef\@articlenumber{#1}}

\def\@externalbibliography{}
\newcommand{\externalbibliography}[1]{\gdef\@externalbibliography{#1}}

\def\@reftitle{}
\newcommand{\reftitle}[1]{\gdef\@reftitle{#1}}

%Reprint
\def\@originalarttype{}
\newcommand{\originalarttype}[1]{\gdef\@originalarttype{#1}}%


%% ORCID
% Make Orcid icon
\definecolor{lime}{HTML}{A6CE39}
\newcommand{\orcidicon}{%
	\begin{tikzpicture}
	\draw[lime, fill=lime] (0,0) 
		circle [radius=0.16] 
		node[white] {{\fontfamily{qag}\selectfont \tiny ID}};
	\draw[white, fill=white] (-0.0625,0.095) 
		circle [radius=0.007];
	\end{tikzpicture}
	\hspace{-2mm}
}

% Define link and button for each author
\foreach \x in {A, ..., Z}{%
\expandafter\xdef\csname orcid\x\endcsname{\noexpand\href{https://orcid.org/\csname orcidauthor\x\endcsname}{\noexpand\orcidicon}}
}

%%%% Journal name for the header
\newcommand{\journalname}{%
  \ifthenelse{\equal{\@journal}{test}}{Test}{}%
  \ifthenelse{\equal{\@journal}{notspecified}}{MDPI}{}%
  \ifthenelse{\equal{\@journal}{actuators}}{Actuators}{}%
  \ifthenelse{\equal{\@journal}{addictions}}{Addictions}{}%
  \ifthenelse{\equal{\@journal}{admsci}}{Adm. Sci.}{}%
  \ifthenelse{\equal{\@journal}{aerospace}}{Aerospace}{}%
  \ifthenelse{\equal{\@journal}{agriculture}}{Agriculture}{}%
  \ifthenelse{\equal{\@journal}{agronomy}}{Agronomy}{}%
  \ifthenelse{\equal{\@journal}{algorithms}}{Algorithms}{}%
  \ifthenelse{\equal{\@journal}{animals}}{Animals}{}%
  \ifthenelse{\equal{\@journal}{antibiotics}}{Antibiotics}{}%
  \ifthenelse{\equal{\@journal}{antibodies}}{Antibodies}{}%
  \ifthenelse{\equal{\@journal}{antioxidants}}{Antioxidants}{}%
  \ifthenelse{\equal{\@journal}{applsci}}{Appl. Sci.}{}%
  \ifthenelse{\equal{\@journal}{arts}}{Arts}{}%
  \ifthenelse{\equal{\@journal}{asi}}{Appl. Syst. Innov.}{}%
  \ifthenelse{\equal{\@journal}{atmosphere}}{Atmosphere}{}%
  \ifthenelse{\equal{\@journal}{atoms}}{Atoms}{}%
  \ifthenelse{\equal{\@journal}{axioms}}{Axioms}{}%
  \ifthenelse{\equal{\@journal}{batteries}}{Batteries}{}%
  \ifthenelse{\equal{\@journal}{bdcc}}{Big Data Cogn. Comput.}{}%
  \ifthenelse{\equal{\@journal}{behavsci}}{Behav. Sci.}{}%
  \ifthenelse{\equal{\@journal}{beverages}}{Beverages}{}%
  \ifthenelse{\equal{\@journal}{bioengineering}}{Bioengineering}{}%
  \ifthenelse{\equal{\@journal}{biology}}{Biology}{}%
  \ifthenelse{\equal{\@journal}{biomedicines}}{Biomedicines}{}%
  \ifthenelse{\equal{\@journal}{biomimetics}}{Biomimetics}{}%
  \ifthenelse{\equal{\@journal}{biomolecules}}{Biomolecules}{}%
  \ifthenelse{\equal{\@journal}{biosensors}}{Biosensors}{}%
  \ifthenelse{\equal{\@journal}{brainsci}}{Brain Sci.}{}%
  \ifthenelse{\equal{\@journal}{buildings}}{Buildings}{}%
  \ifthenelse{\equal{\@journal}{carbon}}{C}{}%
  \ifthenelse{\equal{\@journal}{cancers}}{Cancers}{}%
  \ifthenelse{\equal{\@journal}{catalysts}}{Catalysts}{}%
  \ifthenelse{\equal{\@journal}{cells}}{Cells}{}%
  \ifthenelse{\equal{\@journal}{ceramics}}{Ceramics}{}%
  \ifthenelse{\equal{\@journal}{challenges}}{Challenges}{}%
  \ifthenelse{\equal{\@journal}{chemengineering}}{ChemEngineering}{}%
  \ifthenelse{\equal{\@journal}{chemosensors}}{Chemosensors}{}%
  \ifthenelse{\equal{\@journal}{children}}{Children}{}%
  \ifthenelse{\equal{\@journal}{climate}}{Climate}{}%
  \ifthenelse{\equal{\@journal}{coatings}}{Coatings}{}%
  \ifthenelse{\equal{\@journal}{colloids}}{Colloids Interfaces}{}%
  \ifthenelse{\equal{\@journal}{computation}}{Computation}{}%
  \ifthenelse{\equal{\@journal}{computers}}{Computers}{}%
  \ifthenelse{\equal{\@journal}{condensedmatter}}{Condens. Matter}{}%
  \ifthenelse{\equal{\@journal}{cosmetics}}{Cosmetics}{}%
  \ifthenelse{\equal{\@journal}{cryptography}}{Cryptography}{}%
  \ifthenelse{\equal{\@journal}{crystals}}{Crystals}{}%
  \ifthenelse{\equal{\@journal}{cybersecurity}}{Cybersecurity}{}%
  \ifthenelse{\equal{\@journal}{data}}{Data}{}%
  \ifthenelse{\equal{\@journal}{dentistry}}{Dent. J.}{}%
  \ifthenelse{\equal{\@journal}{designs}}{Designs}{}%
  \ifthenelse{\equal{\@journal}{diagnostics}}{Diagnostics}{}%
  \ifthenelse{\equal{\@journal}{diseases}}{Diseases}{}%
  \ifthenelse{\equal{\@journal}{diversity}}{Diversity}{}%
  \ifthenelse{\equal{\@journal}{drones}}{Drones}{}%
  \ifthenelse{\equal{\@journal}{econometrics}}{Econometrics}{}%
  \ifthenelse{\equal{\@journal}{economies}}{Economies}{}%
  \ifthenelse{\equal{\@journal}{education}}{Educ. Sci.}{}%
  \ifthenelse{\equal{\@journal}{electrochemistry}}{Electrochemistry}{}%
  \ifthenelse{\equal{\@journal}{electronics}}{Electronics}{}%
  \ifthenelse{\equal{\@journal}{energies}}{Energies}{}%
  \ifthenelse{\equal{\@journal}{entropy}}{Entropy}{}%
  \ifthenelse{\equal{\@journal}{environments}}{Environments}{}%
  \ifthenelse{\equal{\@journal}{epigenomes}}{Epigenomes}{}%
  \ifthenelse{\equal{\@journal}{est}}{Electrochem. Sci. Technol.}{}%
  \ifthenelse{\equal{\@journal}{fermentation}}{Fermentation}{}%
  \ifthenelse{\equal{\@journal}{fibers}}{Fibers}{}%
  \ifthenelse{\equal{\@journal}{fire}}{Fire}{}%
  \ifthenelse{\equal{\@journal}{fishes}}{Fishes}{}%
  \ifthenelse{\equal{\@journal}{fluids}}{Fluids}{}%
  \ifthenelse{\equal{\@journal}{foods}}{Foods}{}%
  \ifthenelse{\equal{\@journal}{forests}}{Forests}{}%
  \ifthenelse{\equal{\@journal}{fractalfract}}{Fractal Fract.}{}%
  \ifthenelse{\equal{\@journal}{futureinternet}}{Future Internet}{}%
  \ifthenelse{\equal{\@journal}{galaxies}}{Galaxies}{}%
  \ifthenelse{\equal{\@journal}{games}}{Games}{}%
  \ifthenelse{\equal{\@journal}{gastrointestdisord}}{Gastrointest. Disord.}{}%
  \ifthenelse{\equal{\@journal}{gels}}{Gels}{}%
  \ifthenelse{\equal{\@journal}{genealogy}}{Genealogy}{}%
  \ifthenelse{\equal{\@journal}{genes}}{Genes}{}%
  \ifthenelse{\equal{\@journal}{geosciences}}{Geosciences}{}%
  \ifthenelse{\equal{\@journal}{geriatrics}}{Geriatrics}{}%
  \ifthenelse{\equal{\@journal}{hazardousmatters}}{Hazard. Matters}{}%
  \ifthenelse{\equal{\@journal}{healthcare}}{Healthcare}{}%
  \ifthenelse{\equal{\@journal}{heritage}}{Heritage}{}%
  \ifthenelse{\equal{\@journal}{highthroughput}}{High-Throughput}{}%
  \ifthenelse{\equal{\@journal}{horticulturae}}{Horticulturae}{}%
  \ifthenelse{\equal{\@journal}{humanities}}{Humanities}{}%
  \ifthenelse{\equal{\@journal}{hydrology}}{Hydrology}{}%
  \ifthenelse{\equal{\@journal}{informatics}}{Informatics}{}%
  \ifthenelse{\equal{\@journal}{information}}{Information}{}%
  \ifthenelse{\equal{\@journal}{infrastructures}}{Infrastructures}{}%
  \ifthenelse{\equal{\@journal}{inorganics}}{Inorganics}{}%
  \ifthenelse{\equal{\@journal}{insects}}{Insects}{}%
  \ifthenelse{\equal{\@journal}{instruments}}{Instruments}{}%
  \ifthenelse{\equal{\@journal}{ijerph}}{Int. J. Environ. Res. Public Health}{}%
  \ifthenelse{\equal{\@journal}{ijfs}}{Int. J. Financial Stud.}{}%
  \ifthenelse{\equal{\@journal}{ijms}}{Int. J. Mol. Sci.}{}%
  \ifthenelse{\equal{\@journal}{ijgi}}{ISPRS Int. J. Geo-Inf.}{}%
  \ifthenelse{\equal{\@journal}{ijtpp}}{Int. J. Turbomach. Propuls. Power}{}%
  \ifthenelse{\equal{\@journal}{inventions}}{Inventions}{}%
  \ifthenelse{\equal{\@journal}{jjournal}}{J}{}%
  \ifthenelse{\equal{\@journal}{jcdd}}{J. Cardiovasc. Dev. Dis.}{}%
  \ifthenelse{\equal{\@journal}{jcm}}{J. Clin. Med.}{}%
  \ifthenelse{\equal{\@journal}{jcs}}{J. Compos. Sci.}{}%
  \ifthenelse{\equal{\@journal}{jdb}}{J. Dev. Biol.}{}%
  \ifthenelse{\equal{\@journal}{jfb}}{J. Funct. Biomater.}{}%   
  \ifthenelse{\equal{\@journal}{jfmk}}{J. Funct. Morphol. Kinesiol.}{}%   
  \ifthenelse{\equal{\@journal}{jof}}{J. Fungi}{}%
  \ifthenelse{\equal{\@journal}{jimaging}}{J. Imaging}{}%
  \ifthenelse{\equal{\@journal}{jintelligence}}{J. Intell.}{}% 
  \ifthenelse{\equal{\@journal}{jlpea}}{J. Low Power Electron. Appl.}{}%
  \ifthenelse{\equal{\@journal}{jmmp}}{J. Manuf. Mater. Process.}{}%
  \ifthenelse{\equal{\@journal}{jmse}}{J. Mar. Sci. Eng.}{}%
  \ifthenelse{\equal{\@journal}{jpm}}{J. Pers. Med.}{}%
  \ifthenelse{\equal{\@journal}{jrfm}}{J. Risk Financial Manag.}{}%
  \ifthenelse{\equal{\@journal}{jsan}}{J. Sens. Actuator Netw.}{}%
  \ifthenelse{\equal{\@journal}{land}}{Land}{}%
  \ifthenelse{\equal{\@journal}{languages}}{Languages}{}%
  \ifthenelse{\equal{\@journal}{laws}}{Laws}{}%
  \ifthenelse{\equal{\@journal}{life}}{Life}{}%
  \ifthenelse{\equal{\@journal}{literature}}{Literature}{}%
  \ifthenelse{\equal{\@journal}{logistics}}{Logistics}{}%
  \ifthenelse{\equal{\@journal}{lubricants}}{Lubricants}{}%
  \ifthenelse{\equal{\@journal}{machines}}{Machines}{}%
  \ifthenelse{\equal{\@journal}{magnetochemistry}}{Magnetochemistry}{}%
  \ifthenelse{\equal{\@journal}{make}}{Mach. Learn. Knowl. Extr.}{}%
  \ifthenelse{\equal{\@journal}{marinedrugs}}{Mar. Drugs}{}%
  \ifthenelse{\equal{\@journal}{materials}}{Materials}{}%
  \ifthenelse{\equal{\@journal}{mathematics}}{Mathematics}{}%
  \ifthenelse{\equal{\@journal}{mca}}{Math. Comput. Appl.}{}%
  \ifthenelse{\equal{\@journal}{medsci}}{Med. Sci.}{}% 
  \ifthenelse{\equal{\@journal}{medicines}}{Medicines}{}%
  \ifthenelse{\equal{\@journal}{membranes}}{Membranes}{}%
  \ifthenelse{\equal{\@journal}{metabolites}}{Metabolites}{}%
  \ifthenelse{\equal{\@journal}{metals}}{Metals}{}%
  \ifthenelse{\equal{\@journal}{microarrays}}{Microarrays}{}%
  \ifthenelse{\equal{\@journal}{micromachines}}{Micromachines}{}%
  \ifthenelse{\equal{\@journal}{microorganisms}}{Microorganisms}{}%
  \ifthenelse{\equal{\@journal}{minerals}}{Minerals}{}%
  \ifthenelse{\equal{\@journal}{modelling}}{Modelling}{}
  \ifthenelse{\equal{\@journal}{molbank}}{Molbank}{}%
  \ifthenelse{\equal{\@journal}{molecules}}{Molecules}{}%
  \ifthenelse{\equal{\@journal}{mps}}{Methods and Protoc.}{}%
  \ifthenelse{\equal{\@journal}{mti}}{Multimodal Technologies and Interact.}{}%
  \ifthenelse{\equal{\@journal}{nanomaterials}}{Nanomaterials}{}%
  \ifthenelse{\equal{\@journal}{ncrna}}{Non-coding RNA}{}%
  \ifthenelse{\equal{\@journal}{neonatalscreening}}{Int. J. Neonatal Screen.}{}%
  \ifthenelse{\equal{\@journal}{neuroglia}}{Neuroglia}{}%
  \ifthenelse{\equal{\@journal}{nitrogen}}{Nitrogen}{}%
  \ifthenelse{\equal{\@journal}{nutrients}}{Nutrients}{}%
  \ifthenelse{\equal{\@journal}{ohbm}}{J. Otorhinolaryngol. Hear. Balance Med.}{}%
  \ifthenelse{\equal{\@journal}{particles}}{Particles}{}%
  \ifthenelse{\equal{\@journal}{pathogens}}{Pathogens}{}%
  \ifthenelse{\equal{\@journal}{pharmaceuticals}}{Pharmaceuticals}{}%
  \ifthenelse{\equal{\@journal}{pharmaceutics}}{Pharmaceutics}{}%
  \ifthenelse{\equal{\@journal}{pharmacy}}{Pharmacy}{}%
  \ifthenelse{\equal{\@journal}{philosophies}}{Philosophies}{}%
  \ifthenelse{\equal{\@journal}{photonics}}{Photonics}{}%
  \ifthenelse{\equal{\@journal}{plants}}{Plants}{}%
  \ifthenelse{\equal{\@journal}{plasma}}{Plasma}{}%
  \ifthenelse{\equal{\@journal}{polymers}}{Polymers}{}%
  \ifthenelse{\equal{\@journal}{polysaccharides}}{Polysaccharides}{}%
  \ifthenelse{\equal{\@journal}{proceedings}}{Proceedings}{}%
  \ifthenelse{\equal{\@journal}{processes}}{Processes}{}%
  \ifthenelse{\equal{\@journal}{proteomes}}{Proteomes}{}%
  \ifthenelse{\equal{\@journal}{publications}}{Publications}{}%
  \ifthenelse{\equal{\@journal}{quaternary}}{Quaternary}{}%
  \ifthenelse{\equal{\@journal}{qubs}}{Quantum Beam Sci.}{}%
  \ifthenelse{\equal{\@journal}{recycling}}{Recycling}{}%
  \ifthenelse{\equal{\@journal}{religions}}{Religions}{}%
  \ifthenelse{\equal{\@journal}{remotesensing}}{Remote Sens.}{}%
  \ifthenelse{\equal{\@journal}{reports}}{Reports}{}%
  \ifthenelse{\equal{\@journal}{resources}}{Resources}{}%
  \ifthenelse{\equal{\@journal}{risks}}{Risks}{}%
  \ifthenelse{\equal{\@journal}{robotics}}{Robotics}{}%
  \ifthenelse{\equal{\@journal}{safety}}{Safety}{}%
  \ifthenelse{\equal{\@journal}{scipharm}}{Sci. Pharm.}{}%
  \ifthenelse{\equal{\@journal}{sensors}}{Sensors}{}%
  \ifthenelse{\equal{\@journal}{separations}}{Separations}{}%
  \ifthenelse{\equal{\@journal}{sexes}}{Sexes}{}%
  \ifthenelse{\equal{\@journal}{sinusitis}}{Sinusitis}{}%
  \ifthenelse{\equal{\@journal}{socsci}}{Soc. Sci.}{}%
  \ifthenelse{\equal{\@journal}{societies}}{Societies}{}%
  \ifthenelse{\equal{\@journal}{soils}}{Soils}{}%
  \ifthenelse{\equal{\@journal}{sports}}{Sports}{}%
  \ifthenelse{\equal{\@journal}{standards}}{Standards}{}%
  \ifthenelse{\equal{\@journal}{stats}}{Stats}{}%
  \ifthenelse{\equal{\@journal}{surgeries}}{Surgeries}{}%
  \ifthenelse{\equal{\@journal}{sustainability}}{Sustainability}{}%
  \ifthenelse{\equal{\@journal}{symmetry}}{Symmetry}{}%
  \ifthenelse{\equal{\@journal}{systems}}{Systems}{}%
  \ifthenelse{\equal{\@journal}{technologies}}{Technologies}{}%
  \ifthenelse{\equal{\@journal}{toxics}}{Toxics}{}%
  \ifthenelse{\equal{\@journal}{toxins}}{Toxins}{}%
  \ifthenelse{\equal{\@journal}{tropicalmed}}{Trop. Med. Infect. Dis.}{}%
  \ifthenelse{\equal{\@journal}{universe}}{Universe}{}%
  \ifthenelse{\equal{\@journal}{urbansci}}{Urban Sci.}{}%
  \ifthenelse{\equal{\@journal}{vaccines}}{Vaccines}{}%
  \ifthenelse{\equal{\@journal}{vetsci}}{Vet. Sci.}{}%
  \ifthenelse{\equal{\@journal}{vibration}}{Vibration}{}%
  \ifthenelse{\equal{\@journal}{viruses}}{Viruses}{}%
  \ifthenelse{\equal{\@journal}{vision}}{Vision}{}%
  \ifthenelse{\equal{\@journal}{water}}{Water}{}%
  \ifthenelse{\equal{\@journal}{wem}}{Wildl. Ecol. Manag.}{}%
  }
    
%%%% Header and footer on first page
%% The plain page style needs to be redefined because with \maketitle in the article class, LaTeX applies the the plain page style automatically to the first page.
\ifthenelse{\equal{\@journal}{preprints} %
		\OR \equal{\@arttype}{Reprint} %
		\OR \equal{\@arttype}{Book}}{%
	\fancypagestyle{plain}{%
		\fancyhf{}
		\ifthenelse{\equal{\@arttype}{Reprint} %
			\OR \equal{\@arttype}{Book}}{
        			\fancyfoot[C]{%
        				\footnotesize%
        				\thepage}
       	 		\ifthenelse{\equal{\@arttype}{Book}}{}{%
        				\fancyfoot[L]{%
        					\footnotesize%
        					{\em \journalname}\ %
        					{\bfseries {\@pubyear}}, %
        					{\em \@pubvolume}, %
        					\ifthenelse{\equal{\@articlenumber}{\@empty}}{%
        						\@firstpage --\pageref*{LastPage}
        						}{\@articlenumber}%
        					}
        				\fancyfoot[R]{%
        	 				\footnotesize%
        					{\changeurlcolor{black}%
        					\href{http://www.mdpi.com/journal/\@journal}%
        					{www.mdpi.com/journal/\@journal}}%
        					}
        				}
     	   		}		
		}
	}{%
	\ifthenelse{\equal{\@arttype}{Supfile}}{
		\fancypagestyle{plain}{
			\fancyhf{}
			\fancyhead[R]{
				\footnotesize %
				S\thepage{} of S\pageref*{LastPage}%
				}%
			\fancyhead[L]{
				\footnotesize %
				\ifthenelse{\equal{\@status}{submit}}{%
					Version {\@ \today} submitted to {\em\journalname}%
					}{%
					{\em \journalname} %
					{\bfseries \@pubyear}, %
					{\em \@pubvolume}, %
					\ifthenelse{\equal{\@articlenumber}{\@empty}}{%
						\@firstpage --\pageref*{LastPage}%
						}{%
						\@articlenumber%
						}%
					; doi:{\changeurlcolor{black}%
        					\href{https://doi.org/\@doinum}%
        					{\@doinum}}%
					}%
				}%
			}%
		}{
		\fancypagestyle{plain}{
			\fancyhf{}
			\fancyfoot[L]{
				\footnotesize%
 	 				\ifthenelse{\equal{\@status}{submit}}{%
					Submitted to {\em\journalname}, %
					pages \thepage \ -- \color{black}{\pageref*{LastPage}}%
					}{
					{\em \journalname}\ %
					{\bfseries {\@pubyear}}, %
					{\em \@pubvolume}, %
					\ifthenelse{\equal{\@articlenumber}{\@empty}}{%
						\@firstpage --\pageref*{LastPage}%
						}{%
						\@articlenumber%
						}%
						; doi:{\changeurlcolor{black}%
        					\href{https://doi.org/\@doinum}%
        					{\@doinum}}%
					}%
				}%
			\fancyfoot[R]{
 				\footnotesize%
				{\changeurlcolor{black}%
				\href{http://www.mdpi.com/journal/\@journal}%
				{www.mdpi.com/journal/\@journal}}%
				}%
			\fancyhead{}
		 	\renewcommand{\headrulewidth}{0.0pt}%
			}
		}%
	}%	

%%%% Maketitle part 1: Logo, Arttype, Title, Author
\renewcommand{\@maketitle}{
	\begin{flushleft}
	\ifthenelse{\equal{\@arttype}{Supfile}}{%
		\fontsize{18}{18}\selectfont
		\raggedright
		\noindent\textbf{Supplementary Materials: \@Title}%
		\par
		\vspace{12pt}
		\fontsize{10}{10}\selectfont
		\noindent\boldmath\bfseries{\@Author}
		}{%
		\ifthenelse{\equal{\@arttype}{Book}}{}{%
			\vspace*{-1.75cm}
			}
		{%0
		\ifthenelse{\equal{\@journal}{preprints}
			\OR \equal{\@arttype}{Book}}{}{%
				\ifthenelse{\equal{\@status}{submit}}{%	
					\hfill \href{http://www.mdpi.com}{%
					\includegraphics[height=1cm]{logo-mdpi}}\vspace{0.5cm}%
					}{
					\href{http://www.mdpi.com/journal/\@journal}{
					\includegraphics[height=1.2cm]{\@journal-logo}}%
					\hfill
					\ifthenelse{\equal{\@journal}{proceedings}}{
						\href{http://www.mdpi.com/journal/\@journal}{
						\includegraphics[height=1.2cm]{logo-conference}
						\hfill}
						}{}
					\ifthenelse{\equal{\@journal}{scipharm}}{%
						\href{http://www.mdpi.com}{\includegraphics[height=1cm]{logo-mdpi-scipharm}}%
						}{%
						\href{http://www.mdpi.com}{\includegraphics[height=1cm]{logo-mdpi}}%
						}%
					}%
			}%
		\par
		}%0
		{%1
    		\vspace{14pt}
    		\fontsize{10}{10}\selectfont
		\ifthenelse{\equal{\@arttype}{Book}}{}{
			\ifthenelse{\equal{\@arttype}{Reprint}}{%
				\textit{\ifthenelse{\equal{\@originalarttype}{\@empty}}{Article}{\@originalarttype}}%
				}{%
				\textit{\@arttype}%
				}%
			}%	
 	   	\par%
    		}%1
    		{%2
   	 	\vspace{-1pt}
  	  	\fontsize{18}{18}\selectfont
   	 	\boldmath\bfseries{\@Title}
   	 	\par
   	 	\vspace{15pt}
   	 	}%2
   		{%3
    		\boldmath\bfseries{\@Author}
    		\par
    		\vspace{-4pt}
    		}%3
		}
	\end{flushleft}%
	}

% Commands for hanging indent
\newcommand{\dist}{1.7em}
\newcommand{\hang}{\hangafter=1\hangindent=\dist\noindent}

%%%% Maketitle part 2
\newcommand{\maketitlen}{ 
\ifthenelse{\equal{\@arttype}{Book}}{\vspace{12pt}}{
	\begin{flushleft}
	\begin{spacing}{1.35}
	\leftskip0.2cm
	\fontsize{9}{9}\selectfont
	{%
	\ifthenelse{\equal{\firstargument}{1}}{}{%
	\hang}\@address
	\par
	}%
	{%
	\ifthenelse{\equal{\@authornum}{author}}{}{%
	\ifthenelse{\equal{\@corres}{\@empty}}{}{%
	\hang\textbf{*} \tabto{\dist} \@corres}
	\par
	}
	}%
	{%
	\ifthenelse{\equal{\@conference}{\@empty}}{}{%
	\hang$\dagger$ \tabto{\dist} This paper is an extended version of our paper published in\space \@conference.}
	\par
	}%
	{%
	\ifthenelse{\equal{\@firstnote}{\@empty}}{}{%
	\hang\ifthenelse{\equal{\@conference}{\@empty}}{$\dagger$}{$\ddagger$} \tabto{\dist} \@firstnote}	
	\par
	}%
	{%
	\ifthenelse{\equal{\@secondnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{$\ddagger$}{\S} \tabto{\dist} \@secondnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@thirdnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{\S}{$\|$} \tabto{\dist} \@thirdnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@fourthnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{$\|$}{\P} \tabto{\dist} \@fourthnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@fifthnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{\P}{**} \tabto{\dist} \@fifthnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@sixthnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{**}{$\dagger\dagger$} \tabto{\dist} \@sixthnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@seventhnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{$\dagger\dagger$}{$\ddagger\ddagger$} \tabto{\dist} \@seventhnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@eighthnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{$\ddagger\ddagger$}{***} \tabto{\dist} \@eighthnote}
	\par
	}%
	{%
	\vspace{6pt}
	\ifthenelse{\equal{\@externaleditor}{\@empty}}{}{\@externaleditor}
	\par
	}%
	{%
	\ifthenelse{\equal{\@status}{submit}}{Version {\@ \today} submitted to \journalname}{\@history}
	\par
	\vspace{-4pt}
	}%
	\end{spacing}
	\end{flushleft}
}
}

%%%% Abstract, keywords, journal data, PACS, MSC, JEL
\newcommand{\abstractkeywords}{
\vspace{-8pt}
{% For journal Applied Sciences:
\ifthenelse{\equal{\@featuredapplication}{\@empty}}{}{
\begingroup
\leftskip0.2cm
\noindent\textbf{Featured Application:\space\@featuredapplication}
\vspace{12pt}
\par
\endgroup}
}%
{%10
\begingroup
\leftskip0.2cm 
\ifthenelse{\equal{\@simplesumm}{\@empty}}{}{
\noindent\textbf{Simple Summary:\space}\@simplesumm
\vspace{12pt}
\par
}
\ifthenelse{\equal{\@abstract}{\@empty}}{}{
\noindent\textbf{Abstract:\space}\@abstract
\vspace{12pt}
\par
}
\endgroup
}%10
{% For journal Data:
\ifthenelse{\equal{\@dataset}{\@empty}}{}{
\begingroup
\leftskip0.2cm
\noindent\textbf{Data Set:\space}\@dataset
\vspace{12pt}
\par
\endgroup}
}%
{%For journal Data:
\ifthenelse{\equal{\@datasetlicense}{\@empty}}{}{
\begingroup
\leftskip0.2cm
\noindent\textbf{Data Set License:\space}\@datasetlicense
\vspace{12pt}
\par
\endgroup}
}%
{%11
\begingroup
\leftskip0.2cm
\ifthenelse{\equal{\@keyword}{\@empty}}{}{
\noindent\textbf{Keywords:\space}\@keyword
\vspace{12pt}
\par
}
\endgroup
}%11
{%For journal Toxins:
\begingroup
\leftskip0.2cm
\ifthenelse{\equal{\@keycontribution}{\@empty}}{}{
\noindent\textbf{Key contribution:\space}\@keycontribution
\vspace{12pt}
\par
}
\endgroup
}%11
{%12
\ifthenelse{\equal{\@pacs}{\@empty}}{}{
\begingroup
\leftskip0.2cm
\noindent\textbf{PACS:\space}\@pacs
\vspace{12pt}
\par
\endgroup}
}%12
{%13
\ifthenelse{\equal{\@msc}{\@empty}}{}{
\begingroup
\leftskip0.2cm
\noindent\textbf{MSC:\space}\@msc
\vspace{12pt}
\par
\endgroup}
}%13
{%14
\ifthenelse{\equal{\@jel}{\@empty}}{}{
\begingroup
\leftskip0.2cm
\noindent\textbf{JEL Classification:\space}\@jel
\vspace{12pt}
\par
\endgroup}
}%14
\vspace{4pt}
\hrule
\vspace{12pt}
}


%%%% Print maketitle and abstractkeywords
\ifthenelse{\equal{\@arttype}{Supfile}}{
	\AfterEndPreamble{
	\maketitle
	\let\maketitle\relax
	\ifthenelse{\equal{\@status}{submit}}{\linenumbers}{}
	}%
	}{
	\AfterEndPreamble{
	\maketitle
	\let\maketitle\relax
	\maketitlen
	\let\maketitlen\relax
	\ifthenelse{\equal{\@status}{submit}}{\linenumbers}{}
	\abstractkeywords
	}%
	}
\AtBeginDocument{
	\DeclareSymbolFont{AMSb}{U}{msb}{m}{n}
	\DeclareSymbolFontAlphabet{\mathbb}{AMSb}
	}

%%%% Font size in Tables
\AtEndPreamble{
	\def\@tablesize{}
	\newcommand{\tablesize}[1]{\gdef\@tablesize{#1}}
	\let\oldtabular\tabular
	\renewcommand{\tabular}{\ifthenelse{\equal{\@tablesize}{\@empty}}{\small}{\@tablesize}\oldtabular}
}

%%%% Section headings
\setcounter{secnumdepth}{4} %i.e., section numbering depth, which defaults to 3 in the article class. To get paragraphs numbered and counted, increase the default value of secnumdepth to 4

\titleformat {\section} [block] {\raggedright \fontsize{10}{10}\selectfont\bfseries} {\thesection.\space} {0pt} {}
\titlespacing {\section} {0pt} {12pt} {6pt}

\titleformat {\subsection} [block] {\raggedright \fontsize{10}{10}\selectfont\itshape} {\thesubsection.\space} {0pt} {}
\titlespacing {\subsection} {0pt} {12pt} {6pt}

\titleformat {\subsubsection} [block] {\raggedright \fontsize{10}{10}\selectfont} {\thesubsubsection.\space} {0pt} {}
\titlespacing {\subsubsection} {0pt} {12pt} {6pt}

\titleformat {\paragraph} [block] {\raggedright \fontsize{10}{10}\selectfont} {} {0pt} {}
\titlespacing {\paragraph} {0pt} {12pt} {6pt}

%%%% Special section title style for back matter
\newcommand{\supplementary}[1]{
\par\vspace{6pt}\noindent{\fontsize{9}{9}\selectfont\textbf{Supplementary Materials:} {#1}\par}}

\newcommand{\acknowledgments}[1]{
\vspace{6pt}\noindent{\fontsize{9}{9}\selectfont\textbf{Acknowledgments:} {#1}\par}}

\newcommand{\authorcontributions}[1]{%
\vspace{6pt}\noindent{\fontsize{9}{9}\selectfont\textbf{Author Contributions:} {#1}\par}}

\newcommand{\conflictsofinterest}[1]{%
\vspace{6pt}\noindent{\fontsize{9}{9}\selectfont\textbf{Conflicts of Interest:} {#1}\par}}

\newcommand{\sampleavailability}[1]{%
\vspace{12pt}\noindent{\fontsize{9}{9}\selectfont\textbf{Sample Availability:} {#1}\par}}

\newcommand{\abbreviations}[1]{%
\vspace{12pt}\noindent{\selectfont\textbf{Abbreviations}\par\vspace{6pt}\noindent {\fontsize{9}{9}\selectfont #1}\par}}

%%%%% Defines the appendix
\def\@appendixtitles{}
\newcommand{\appendixtitles}[1]{\gdef\@appendixtitles{#1}}

\def\@appendixsections{}
\newcommand{\appendixsections}[1]{\gdef\@appendixsections{#1}}

\renewcommand{\appendix}{%
\setcounter{section}{0}%
\setcounter{subsection}{0}%
\setcounter{subsubsection}{0}%
%
\gdef\thesection{\@Alph\c@section}%
\gdef\thesubsection{\@Alph\c@section.\@arabic\c@subsection}%
%	
\titleformat {\section} [block] {\raggedright \fontsize{10}{10}\selectfont\bfseries} {%
	\ifthenelse{\equal{\@appendixtitles}{yes}}{%
		\ifthenelse{\equal{\@appendixsections}{multiple}}{%
			\appendixname~\thesection.%
			}{%
			\appendixname.}
			}{%
		\ifthenelse{\equal{\@appendixsections}{multiple}}{%
			\appendixname~\thesection~%
			}{%
			\appendixname~}
		}
	} {0pt} {}
\titlespacing {\section} {0pt} {12pt} {6pt}
%
\titleformat {\subsection} [block] {\raggedright \fontsize{10}{10}\selectfont\itshape} {%
	\ifthenelse{\equal{\@appendixtitles}{yes}}{%
		\appendixname~\thesubsection.%
		}{%
		\appendixname~\thesubsection%
		}
	} {0pt} {}
\titlespacing {\subsection} {0pt} {12pt} {6pt}
%
\titleformat {\subsubsection} [block] {\raggedright \fontsize{10}{10}\selectfont} {%
	\ifthenelse{\equal{\@appendixtitles}{yes}}{%
		\appendixname~\thesubsubsection.%
		}{%
		\appendixname~\thesubsubsection%
		}
	} {0pt} {}
\titlespacing {\subsubsection} {0pt} {12pt} {6pt}
%
\gdef\theHsection{\@Alph\c@section.}% for hyperref
\gdef\theHsubsection{\@Alph\c@section.\@arabic\c@subsection}% for hyperref
\csname appendixmore\endcsname
\renewcommand{\thefigure}{A\arabic{figure}}
\setcounter{figure}{0}
\renewcommand{\thetable}{A\arabic{table}}
\setcounter{table}{0}
\renewcommand{\thescheme}{A\arabic{scheme}}
\setcounter{scheme}{0}
\renewcommand{\thechart}{A\arabic{chart}}
\setcounter{chart}{0}
\renewcommand{\theboxenv}{A\arabic{boxenv}}
\setcounter{boxenv}{0}
\renewcommand{\theequation}{A\arabic{equation}}
\setcounter{equation}{0}
\renewcommand{\thetheorem}{A\arabic{theorem}}
\setcounter{theorem}{0}
\renewcommand{\thelemma}{A\arabic{lemma}}
\setcounter{lemma}{0}
\renewcommand{\thecorollary}{A\arabic{corollary}}
\setcounter{corollary}{0}
\renewcommand{\theproposition}{A\arabic{proposition}} 
\setcounter{proposition}{0} 
\renewcommand{\thecharacterization}{A\arabic{characterization}}
\setcounter{characterization}{0} 
\renewcommand{\theproperty}{A\arabic{property}}
\setcounter{property}{0} 
\renewcommand{\theproblem}{A\arabic{problem}}
\setcounter{problem}{0} 
\renewcommand{\theexample}{A\arabic{example}}
\setcounter{example}{0} 
\renewcommand{\theexamplesanddefinitions}{A\arabic{examplesanddefinitions}}
\setcounter{examplesanddefinitions}{0} 
\renewcommand{\theremark}{A\arabic{remark}}
\setcounter{remark}{0} 
\renewcommand{\thedefinition}{A\arabic{definition}}
\setcounter{definition}{0} 
\renewcommand{\thehypothesis}{A\arabic{hypothesis}}
\setcounter{hypothesis}{0}
\renewcommand{\thenotation}{A\arabic{notation}}
\setcounter{notation}{0}
}

%%%% Layout
\ifthenelse{\equal{\@arttype}{Book}}{%%
	\RequirePackage[left=2.05cm,
					right=2.05cm,
					top=2.05cm,
					bottom=2.05cm,
					paperwidth=170mm,
					paperheight=244mm,
					includefoot]{geometry}
	}{
	\RequirePackage[left=2.7cm,
				right=2.7cm,
				top=1.8cm,
				bottom=1.5cm,
				includehead,
				includefoot]{geometry}
	}

\linespread{1.13} 
\setlength{\parindent}{0.75cm}

%%%% Figures and tables
\newfloat{boxenv}{H}{lop}
\floatname{boxenv}{Box}

\newfloat{chart}{H}{lop}
\floatname{chart}{Chart}

\newfloat{scheme}{H}{lop}
\floatname{scheme}{Scheme}

\floatstyle{plain}
\restylefloat{figure}

\floatstyle{plaintop}
\restylefloat{table}

\floatstyle{plaintop}
\restylefloat{boxenv}

\floatstyle{plain}
\restylefloat{scheme}

\RequirePackage{caption} 
\captionsetup[figure]{position=bottom, margin=0.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=12pt, justification=justified}

\captionsetup[scheme]{position=bottom, margin=0.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=12pt, justification=justified}

\captionsetup[chart]{position=bottom, margin=0.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=12pt, justification=justified}

\captionsetup[table]{position=top, margin=0.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=12pt, justification=justified}

\captionsetup[boxenv]{position=top, margin=0.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=12pt, justification=justified}

%% For table footnotes
\newsavebox{\@justcentbox}
\newcommand{\justifyorcenter}[1]{
\sbox \@justcentbox{#1}
\ifdim \wd \@justcentbox >\hsize #1
\else \centerline{#1} \fi
}

%%%% Bullet lists
\newlength{\wideitemsep}
\setlength{\wideitemsep}{.5\itemsep}
\addtolength{\wideitemsep}{-7pt}
\let\olditem\item
\renewcommand{\item}{\setlength{\itemsep}{\wideitemsep}\olditem}

%%%% Supplementary file
\ifthenelse{\equal{\@arttype}{Supfile}}{
	\renewcommand{\thefigure}{S\arabic{figure}}%
	\renewcommand{\thetable}{S\arabic{table}}%
	}{}%

%%%% Header and footer (all pages except the first)
\renewcommand\headrule{} %% set line (from fancyhdr) in header to nothing
\pagestyle{fancy}
\lhead{
	\ifthenelse{\equal{\@journal}{preprints}%
	\OR \equal{\@arttype}{Book}}{%
		}{%
		\fontsize{8}{8}\selectfont%
		\ifthenelse{\equal{\@status}{submit}}{%
			Version {\@ \today} submitted to {\em \journalname}%
			}{%
			\ifthenelse{\equal{\@arttype}{Supfile}}{%
			{\em \journalname} {\bfseries \@pubyear}, {\em \@pubvolume}, %
			\ifthenelse{\equal{\@articlenumber}{}}{%
			\@firstpage --\pageref*{LastPage}%
			}{\@articlenumber}%
			; doi:{\changeurlcolor{black}%
        					\href{https://doi.org/\@doinum}%
        					{\@doinum}}%
			}{%
			{\em \journalname} {\bfseries \@pubyear}, {\em \@pubvolume}, %
			\ifthenelse{\equal{\@articlenumber}{}}{%
			\@firstpage --\pageref*{LastPage}%
			}{%
			\@articlenumber}%
			}%
			}%
		}%
	}
\rhead{
\ifthenelse{\equal{\@arttype}{Reprint} \OR \equal{\@arttype}{Book}}{}{
%	\ifthenelse{\equal{\@journal}{recycling}
%		\OR \equal{\@journal}{philosophies}
%		\OR \equal{\@journal}{sinusitis}
%		\OR \equal{\@journal}{fishes}
%		\OR \equal{\@journal}{scipharm}
%		\OR \equal{\@journal}{jfmk}}{
%			\ifthenelse{\equal{\@arttype}{Supfile}}{
%				\fontsize{8}{8}\selectfont S\thepage{}
%				}{
%				\ifthenelse{\equal{\@status}{submit}}{
%					\fontsize{8}{8}\selectfont\thepage
%					}{
%					\fontsize{8}{8}\selectfont\thepage{}%
%					}%
%				}%
%			}{
			\ifthenelse{\equal{\@arttype}{Supfile}}{
				\fontsize{8}{8}\selectfont S\thepage{} of S\pageref*{LastPage}%
				}{
				\fontsize{8}{8}\selectfont\thepage{} of \pageref*{LastPage}%
				}%
%			}%
		}%
	}

\cfoot{
	\ifthenelse{\equal{\@arttype}{Reprint}
		\OR \equal{\@arttype}{Book}}{%
		\fontsize{8}{8}\selectfont\thepage
		}{}
	}


%%%% Bibliography
\renewcommand\@biblabel[1]{#1.\hfill}
\def\thebibliography#1{
\linespread{1.44} 
\section*{\@reftitle}
\addcontentsline{toc}{section}{References}
\fontsize{9}{9}\selectfont
\list{{\arabic{enumi}}}{\def\makelabel##1{\hss{##1}}
\topsep=0\p@
\parsep=5\p@
\partopsep=0\p@
\itemsep=0\p@
\labelsep=1.5mm
\ifthenelse{\equal{\@journal}{admsci}
\OR \equal{\@journal}{arts}
\OR \equal{\@journal}{econometrics}
\OR \equal{\@journal}{economies}
\OR \equal{\@journal}{genealogy}
\OR \equal{\@journal}{humanities}
\OR \equal{\@journal}{ijfs}
\OR \equal{\@journal}{jrfm}
\OR \equal{\@journal}{laws}
\OR \equal{\@journal}{religions}
\OR \equal{\@journal}{risks}
\OR \equal{\@journal}{socsci}}{%
	\ifthenelse{\equal{\@externalbibliography}{\@empty}}{%
		\itemindent=-7.7mm
		}{%
		\itemindent=-3.3mm}%
		}{%
	\itemindent=0\p@}
\settowidth\labelwidth{\footnotesize[#1]}%
\leftmargin\labelwidth
\advance\leftmargin\labelsep
%\advance\leftmargin -\itemindent
\usecounter{enumi}}
%\def\newblock{\ }
%\sloppy\clubpenalty4000\widowpenalty4000
%\sfcode`\.=1000\relax
}
\let\endthebibliography=\endlist

%%%% Copyright info
\newcommand{\cright}{%
        \ifthenelse{\equal{\@arttype}{Supfile} \OR \equal{\@journal}{preprints}}{%
		}{%
		\vspace{12pt}
		\noindent
		\linespread{1.44} 
		\fontsize{9}{9}\selectfont 
		\ifthenelse{\equal{\@status}{submit}}{
			\noindent \copyright{} {\@ \the\year} by the \@authornum. %
			Submitted to {\em \journalname} for %
			possible open access publication %
			under the terms and conditions of the Creative Commons Attribution %
			\ifthenelse{\equal{\@journal}{ijtpp}}{NonCommercial NoDerivatives (CC BY-NC-ND)}{(CC BY)} %
			license %
			\ifthenelse{\equal{\@journal}{ijtpp}}{
			(\changeurlcolor{black}%
			\href{https://creativecommons.org/licenses/by-nc-nd/4.0/.}%
			{https://creativecommons.org/licenses/by-nc-nd/4.0/}).%
			}{%
			(\changeurlcolor{black}%
			\href{http://creativecommons.org/licenses/by/4.0/.}%
			{http://creativecommons.org/licenses/by/4.0/}).}
			}{
			\begin{minipage}{.2\textwidth}
				\hspace{-1.2mm}%
				\vspace{2mm}%
				\href{http://creativecommons.org/}{%
				\ifthenelse{\equal{\@journal}{ijtpp}}{%
					\includegraphics[width=0.94\textwidth]{logo-ccby-nc-nd}%
					}{%
					\includegraphics[width=0.94\textwidth]{logo-ccby}
					}
				}
			\end{minipage}%
			\begin{minipage}{.79\textwidth}
				\copyright \ {\@copyrightyear} by the \@authornum. %
				Licensee MDPI, Basel, Switzerland. %
				This article is an open access article %
				distributed under the terms and conditions %
				of the Creative Commons Attribution %
				\ifthenelse{\equal{\@journal}{ijtpp}}{NonCommercial NoDerivatives (CC BY-NC-ND)}{(CC BY)} %
				license %
				\ifthenelse{\equal{\@journal}{ijtpp}}{
				(\changeurlcolor{black}%
				\href{https://creativecommons.org/licenses/by-nc-nd/4.0/.}%
				{https://creativecommons.org/licenses/by-nc-nd/4.0/}).%
				}{%
				(\changeurlcolor{black}%
				\href{http://creativecommons.org/licenses/by/4.0/.}%
				{http://creativecommons.org/licenses/by/4.0/}).}
				\end{minipage}
			}
		}
	}
	
%BOOK%
\newcommand{\Authorbox}[1]{\gdef\@Authorbox{#1}} %
\newcommand{\Titlebox}[1]{\gdef\@Titlebox{#1}}%
\newcommand{\Seriestitlebox}[1]{\gdef\@Seriestitlebox{#1}}%
\newcommand{\Editorbox}[1]{\gdef\@Editorbox{#1}} %
\newcommand{\Seriesnamebox}[1]{\gdef\@Seriesnamebox{#1}}%
\newcommand{\Serienumberbox}[1]{\gdef\@Seriesnumberbox{#1}}%
\newcommand{\Volumeumberbox}[1]{\gdef\@Volumenumberbox{#1}}%
\newcommand{\firstpagebox}[1]{\gdef\@firstpagebox{#1}}
\newcommand{\lastpagebox}[1]{\gdef\@lastpagebox{#1}} %

	
\newcommand{\citebox}{
\ifthenelse{\equal{\@arttype}{Book}}{
	\centerline{	
		\fbox{	
		\begin{minipage}[t][][t]{1.001\linewidth}
		\@Authorbox{} \@Titlebox. In \textit{\@Seriestitlebox}; \@Editorbox; \@Seriesnamebox{} \@Seriesnumberbox; MDPI: Basel, Switzerland, 2017; Vol. \@Volumenumberbox, pp. \@firstpagebox{} -- \@lastpagebox.
		\end{minipage}
		}
	}
}}{}
\endinput