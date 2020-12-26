
%% Changes added by Amy Hendrickson, TeXnology Inc,
%% Oct 10, 2019
%% Change to newspaper function
%%
%% Sept 8, 2019
%% added newspaper as a heading, formatted to specs.
%% Added `reprinted' to format.in.ed.booktitle


%% April 7, 2017, June 2017, July 18, 2017
%% Article: '', changed to ,'' , added optional number after volume, not bold,
%% changes to incollection, including adding new field: transnote, to be
%% entered after title and before booktitle.
%% inproceedings, moved year to immediately after author, made other changes.
%%
%%
%% This is file `jasaauthyear.bst',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% merlin.mbs  (with options: `head,ay,nat,nm-rev,keyxyr,dt-beg,yr-par,yrp-per,dtbf,note-yr,tit-qq,qx,jttl-rm,thtit-a,vol-bf,vnum-x,volp-com,num-xser,jnm-x,pub-par,pre-edn,edby,blk-com,ppx,ed,xedn,jabr,etal-it,url,url-blk,bibinfo,nfss,{}')
%% physjour.mbs  (with options: `ay,nat,nm-rev,keyxyr,dt-beg,yr-par,yrp-per,dtbf,note-yr,tit-qq,qx,jttl-rm,thtit-a,vol-bf,vnum-x,volp-com,num-xser,jnm-x,pub-par,pre-edn,edby,blk-com,ppx,ed,xedn,jabr,etal-it,url,url-blk,bibinfo,nfss,{}')
%% geojour.mbs  (with options: `ay,nat,nm-rev,keyxyr,dt-beg,yr-par,yrp-per,dtbf,note-yr,tit-qq,qx,jttl-rm,thtit-a,vol-bf,vnum-x,volp-com,num-xser,jnm-x,pub-par,pre-edn,edby,blk-com,ppx,ed,xedn,jabr,etal-it,url,url-blk,bibinfo,nfss,{}')
%% photjour.mbs  (with options: `ay,nat,nm-rev,keyxyr,dt-beg,yr-par,yrp-per,dtbf,note-yr,tit-qq,qx,jttl-rm,thtit-a,vol-bf,vnum-x,volp-com,num-xser,jnm-x,pub-par,pre-edn,edby,blk-com,ppx,ed,xedn,jabr,etal-it,url,url-blk,bibinfo,nfss,{}')
%% merlin.mbs  (with options: `tail,ay,nat,nm-rev,keyxyr,dt-beg,yr-par,yrp-per,dtbf,note-yr,tit-qq,qx,jttl-rm,thtit-a,vol-bf,vnum-x,volp-com,num-xser,jnm-x,pub-par,pre-edn,edby,blk-com,ppx,ed,xedn,jabr,etal-it,url,url-blk,bibinfo,nfss,{}')
%% ----------------------------------------
%% *** JASA Author-year ***
%% 
%% Copyright 1994-2002 Patrick W Daly
 % ===============================================================
 % IMPORTANT NOTICE:
 % This bibliographic style (bst) file has been generated from one or
 % more master bibliographic style (mbs) files, listed above.
 %
 % This generated file can be redistributed and/or modified under the terms
 % of the LaTeX Project Public License Distributed from CTAN
 % archives in directory macros/latex/base/lppl.txt; either
 % version 1 of the License, or any later version.
 % ===============================================================
 % Name and version information of the main mbs file:
 % \ProvidesFile{merlin.mbs}[2002/10/21 4.05 (PWD, AO, DPC)]
 %   For use with BibTeX version 0.99a or later
 %-------------------------------------------------------------------
 % This bibliography style file is intended for texts in ENGLISH
 % This is an author-year citation style bibliography. As such, it is
 % non-standard LaTeX, and requires a special package file to function properly.
 % Such a package is    natbib.sty   by Patrick W. Daly
 % The form of the \bibitem entries is
 %   \bibitem[Jones et al.(1990)]{key}...
 %   \bibitem[Jones et al.(1990)Jones, Baker, and Smith]{key}...
 % The essential feature is that the label (the part in brackets) consists
 % of the author names, as they should appear in the citation, with the year
 % in parentheses following. There must be no space before the opening
 % parenthesis!
 % With natbib v5.3, a full list of authors may also follow the year.
 % In natbib.sty, it is possible to define the type of enclosures that is
 % really wanted (brackets or parentheses), but in either case, there must
 % be parentheses in the label.
 % The \cite command functions as follows:
 %   \citet{key} ==>>                Jones et al. (1990)
 %   \citet*{key} ==>>               Jones, Baker, and Smith (1990)
 %   \citep{key} ==>>                (Jones et al., 1990)
 %   \citep*{key} ==>>               (Jones, Baker, and Smith, 1990)
 %   \citep[chap. 2]{key} ==>>       (Jones et al., 1990, chap. 2)
 %   \citep[e.g.][]{key} ==>>        (e.g. Jones et al., 1990)
 %   \citep[e.g.][p. 32]{key} ==>>   (e.g. Jones et al., p. 32)
 %   \citeauthor{key} ==>>           Jones et al.
 %   \citeauthor*{key} ==>>          Jones, Baker, and Smith
 %   \citeyear{key} ==>>             1990
 %---------------------------------------------------------------------

ENTRY
  { address
    author
    booktitle
    chapter
    date
    description
    doi
    edition
    editor
    howpublished
    institution
    journal
    key
    language
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    transnote
    title
    type
    url
    volume
    year
  }
  {}
  { label extra.label sort.label short.list }
INTEGERS { output.state before.all mid.sentence after.sentence after.block }
FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}
STRINGS { s t}

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {new.output.nonnull}
{ 's :=
  output.state mid.sentence =
%% changed to get rid of comma before (publisher...)
    { " " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {xoutput}
{ duplicate$ empty$
    'pop$
    'new.output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {xoutput.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'new.output.nonnull
  if$
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}
FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}
FUNCTION {add.blank}
{  " " * before.all 'output.state :=
}

FUNCTION {date.block}
{
  new.sentence
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}
FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}
FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}
FUNCTION {non.stop}
{ duplicate$
   "}" * add.period$
   #-1 #1 substring$ "." =
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}
FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}
FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "\emph{" swap$ * "}" * }
  if$
}
FUNCTION {bolden}
{ duplicate$ empty$
    { pop$ "" }
    { "\textbf{" swap$ * "}" * }
  if$
}
FUNCTION {tie.or.space.prefix}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$
}

FUNCTION {vol.tie.or.space.prefix}
{ duplicate$ text.length$ #3 <
    { "" }
    { "" }
  if$
  swap$
}

FUNCTION {capitalize}
{ "u" change.case$ "t" change.case$ }

FUNCTION {space.word}
{ " " swap$ * " " * }
 % Here are the language-specific definitions for explicit words.
 % Each function has a name bbl.xxx where xxx is the English word.
 % The language selected here is ENGLISH
FUNCTION {bbl.and}
{ "and"}

FUNCTION {bbl.etal}
{ "et~al." }

FUNCTION {bbl.editors}
{ "eds." }

FUNCTION {bbl.editor}
{ "ed." }

FUNCTION {bbl.edby}
{ "edited by" }

FUNCTION {bbl.edition}
{ "ed." }

FUNCTION {bbl.volume}
{""}

FUNCTION {xbbl.volume}
{"Vol. "}

FUNCTION {bbl.of}
{ "of" }

FUNCTION {bbl.number}
{ "number" }

FUNCTION {bbl.nr}
{ "no." }

FUNCTION {bbl.in}
{ "in" }

FUNCTION {bbl.reprintedin}
{ "reprinted in" }

FUNCTION {bbl.pages}
{ "pp." }

FUNCTION {bbl.page}
{ "p." }

FUNCTION {bbl.chapter}
{ "Chap." }

FUNCTION {bbl.techrep}
{ "Technical Report" }

FUNCTION {bbl.mthesis}
{ "Master's thesis" }

FUNCTION {bbl.phdthesis}
{ "Ph.D. thesis" }

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

 %-------------------------------------------------------------------
 % Begin module:
 % \ProvidesFile{physjour.mbs}[2002/01/14 2.2 (PWD)]
MACRO {aa}{"Astron. \& Astrophys."}
MACRO {aasup}{"Astron. \& Astrophys. Suppl. Ser."}
MACRO {aj} {"Astron. J."}
MACRO {aph} {"Acta Phys."}
MACRO {advp} {"Adv. Phys."}
MACRO {ajp} {"Amer. J. Phys."}
MACRO {ajm} {"Amer. J. Math."}
MACRO {amsci} {"Amer. Sci."}
MACRO {anofd} {"Ann. Fluid Dyn."}
MACRO {am} {"Ann. Math."}
MACRO {ap} {"Ann. Phys. (NY)"}
MACRO {adp} {"Ann. Phys. (Leipzig)"}
MACRO {ao} {"Appl. Opt."}
MACRO {apl} {"Appl. Phys. Lett."}
MACRO {app} {"Astroparticle Phys."}
MACRO {apj} {"Astrophys. J."}
MACRO {apjsup} {"Astrophys. J. Suppl."}
MACRO {apss} {"Astrophys. Space Sci."}
MACRO {araa} {"Ann. Rev. Astron. Astrophys."}
MACRO {baas} {"Bull. Amer. Astron. Soc."}
MACRO {baps} {"Bull. Amer. Phys. Soc."}
MACRO {cmp} {"Comm. Math. Phys."}
MACRO {cpam} {"Commun. Pure Appl. Math."}
MACRO {cppcf} {"Comm. Plasma Phys. \& Controlled Fusion"}
MACRO {cpc} {"Comp. Phys. Comm."}
MACRO {cqg} {"Class. Quant. Grav."}
MACRO {cra} {"C. R. Acad. Sci. A"}
MACRO {fed} {"Fusion Eng. \& Design"}
MACRO {ft} {"Fusion Tech."}
MACRO {grg} {"Gen. Relativ. Gravit."}
MACRO {ieeens} {"IEEE Trans. Nucl. Sci."}
MACRO {ieeeps} {"IEEE Trans. Plasma Sci."}
MACRO {ijimw} {"Interntl. J. Infrared \& Millimeter Waves"}
MACRO {ip} {"Infrared Phys."}
MACRO {irp} {"Infrared Phys."}
MACRO {jap} {"J. Appl. Phys."}
MACRO {jasa} {"J. Acoust. Soc. America"}
MACRO {jcp} {"J. Comp. Phys."}
MACRO {jetp} {"Sov. Phys.--JETP"}
MACRO {jfe} {"J. Fusion Energy"}
MACRO {jfm} {"J. Fluid Mech."}
MACRO {jmp} {"J. Math. Phys."}
MACRO {jne} {"J. Nucl. Energy"}
MACRO {jnec} {"J. Nucl. Energy, C: Plasma Phys., Accelerators, Thermonucl. Res."}
MACRO {jnm} {"J. Nucl. Mat."}
MACRO {jpc} {"J. Phys. Chem."}
MACRO {jpp} {"J. Plasma Phys."}
MACRO {jpsj} {"J. Phys. Soc. Japan"}
MACRO {jsi} {"J. Sci. Instrum."}
MACRO {jvst} {"J. Vac. Sci. \& Tech."}
MACRO {nat} {"Nature"}
MACRO {nature} {"Nature"}
MACRO {nedf} {"Nucl. Eng. \& Design/Fusion"}
MACRO {nf} {"Nucl. Fusion"}
MACRO {nim} {"Nucl. Inst. \& Meth."}
MACRO {nimpr} {"Nucl. Inst. \& Meth. in Phys. Res."}
MACRO {np} {"Nucl. Phys."}
MACRO {npb} {"Nucl. Phys. B"}
MACRO {nt/f} {"Nucl. Tech./Fusion"}
MACRO {npbpc} {"Nucl. Phys. B (Proc. Suppl.)"}
MACRO {inc} {"Nuovo Cimento"}
MACRO {nc} {"Nuovo Cimento"}
MACRO {pf} {"Phys. Fluids"}
MACRO {pfa} {"Phys. Fluids A: Fluid Dyn."}
MACRO {pfb} {"Phys. Fluids B: Plasma Phys."}
MACRO {pl} {"Phys. Lett."}
MACRO {pla} {"Phys. Lett. A"}
MACRO {plb} {"Phys. Lett. B"}
MACRO {prep} {"Phys. Rep."}
MACRO {pnas} {"Proc. Nat. Acad. Sci. USA"}
MACRO {pp} {"Phys. Plasmas"}
MACRO {ppcf} {"Plasma Phys. \& Controlled Fusion"}
MACRO {phitrsl} {"Philos. Trans. Roy. Soc. London"}
MACRO {prl} {"Phys. Rev. Lett."}
MACRO {pr} {"Phys. Rev."}
MACRO {physrev} {"Phys. Rev."}
MACRO {pra} {"Phys. Rev. A"}
MACRO {prb} {"Phys. Rev. B"}
MACRO {prc} {"Phys. Rev. C"}
MACRO {prd} {"Phys. Rev. D"}
MACRO {pre} {"Phys. Rev. E"}
MACRO {ps} {"Phys. Scripta"}
MACRO {procrsl} {"Proc. Roy. Soc. London"}
MACRO {rmp} {"Rev. Mod. Phys."}
MACRO {rsi} {"Rev. Sci. Inst."}
MACRO {science} {"Science"}
MACRO {sciam} {"Sci. Am."}
MACRO {sam} {"Stud. Appl. Math."}
MACRO {sjpp} {"Sov. J. Plasma Phys."}
MACRO {spd} {"Sov. Phys.--Doklady"}
MACRO {sptp} {"Sov. Phys.--Tech. Phys."}
MACRO {spu} {"Sov. Phys.--Uspeki"}
MACRO {st} {"Sky and Telesc."}
 % End module: physjour.mbs
 %-------------------------------------------------------------------
 % Begin module:
 % \ProvidesFile{geojour.mbs}[2002/07/10 2.0h (PWD)]
MACRO {aisr} {"Adv. Space Res."}
MACRO {ag} {"Ann. Geophys."}
MACRO {anigeo} {"Ann. Geofis."}
MACRO {angl} {"Ann. Glaciol."}
MACRO {andmet} {"Ann. d. Meteor."}
MACRO {andgeo} {"Ann. d. Geophys."}
MACRO {andphy} {"Ann. Phys.-Paris"}
MACRO {afmgb} {"Arch. Meteor. Geophys. Bioklimatol."}
MACRO {atph} {"Atm\'osphera"}
MACRO {aao} {"Atmos. Ocean"}
MACRO {ass}{"Astrophys. Space Sci."}
MACRO {atenv} {"Atmos. Environ."}
MACRO {aujag} {"Aust. J. Agr. Res."}
MACRO {aumet} {"Aust. Meteorol. Mag."}
MACRO {blmet} {"Bound.-Lay. Meteorol."}
MACRO {bams} {"Bull. Amer. Meteorol. Soc."}
MACRO {cch} {"Clim. Change"}
MACRO {cdyn} {"Clim. Dynam."}
MACRO {cbul} {"Climatol. Bull."}
MACRO {cap} {"Contrib. Atmos. Phys."}
MACRO {dsr} {"Deep-Sea Res."}
MACRO {dhz} {"Dtsch. Hydrogr. Z."}
MACRO {dao} {"Dynam. Atmos. Oceans"}
MACRO {eco} {"Ecology"}
MACRO {empl}{"Earth, Moon and Planets"}
MACRO {envres} {"Environ. Res."}
MACRO {envst} {"Environ. Sci. Technol."}
MACRO {ecms} {"Estuarine Coastal Mar. Sci."}
MACRO {expa}{"Exper. Astron."}
MACRO {geoint} {"Geofis. Int."}
MACRO {geopub} {"Geofys. Publ."}
MACRO {geogeo} {"Geol. Geofiz."}
MACRO {gafd} {"Geophys. Astrophys. Fluid Dyn."}
MACRO {gfd} {"Geophys. Fluid Dyn."}
MACRO {geomag} {"Geophys. Mag."}
MACRO {georl} {"Geophys. Res. Lett."}
MACRO {grl} {"Geophys. Res. Lett."}
MACRO {ga} {"Geophysica"}
MACRO {gs} {"Geophysics"}
MACRO {ieeetap} {"IEEE Trans. Antenn. Propag."}
MACRO {ijawp} {"Int. J. Air Water Pollut."}
MACRO {ijc} {"Int. J. Climatol."}
MACRO {ijrs} {"Int. J. Remote Sens."}
MACRO {jam} {"J. Appl. Meteorol."}
MACRO {jaot} {"J. Atmos. Ocean. Technol."}
MACRO {jatp} {"J. Atmos. Terr. Phys."}
MACRO {jastp} {"J. Atmos. Solar-Terr. Phys."}
MACRO {jce} {"J. Climate"}
MACRO {jcam} {"J. Climate Appl. Meteor."}
MACRO {jcm} {"J. Climate Meteor."}
MACRO {jcy} {"J. Climatol."}
MACRO {jgr} {"J. Geophys. Res."}
MACRO {jga} {"J. Glaciol."}
MACRO {jh} {"J. Hydrol."}
MACRO {jmr} {"J. Mar. Res."}
MACRO {jmrj} {"J. Meteor. Res. Japan"}
MACRO {jm} {"J. Meteor."}
MACRO {jpo} {"J. Phys. Oceanogr."}
MACRO {jra} {"J. Rech. Atmos."}
MACRO {jaes} {"J. Aeronaut. Sci."}
MACRO {japca} {"J. Air Pollut. Control Assoc."}
MACRO {jas} {"J. Atmos. Sci."}
MACRO {jmts} {"J. Mar. Technol. Soc."}
MACRO {jmsj} {"J. Meteorol. Soc. Japan"}
MACRO {josj} {"J. Oceanogr. Soc. Japan"}
MACRO {jwm} {"J. Wea. Mod."}
MACRO {lao} {"Limnol. Oceanogr."}
MACRO {mwl} {"Mar. Wea. Log"}
MACRO {mau} {"Mausam"}
MACRO {meteor} {"``Meteor'' Forschungsergeb."}
MACRO {map} {"Meteorol. Atmos. Phys."}
MACRO {metmag} {"Meteor. Mag."}
MACRO {metmon} {"Meteor. Monogr."}
MACRO {metrun} {"Meteor. Rundsch."}
MACRO {metzeit} {"Meteor. Z."}
MACRO {metgid} {"Meteor. Gidrol."}
MACRO {mwr} {"Mon. Weather Rev."}
MACRO {nwd} {"Natl. Weather Dig."}
MACRO {nzjmfr} {"New Zeal. J. Mar. Freshwater Res."}
MACRO {npg} {"Nonlin. Proc. Geophys."}
MACRO {om} {"Oceanogr. Meteorol."}
MACRO {ocac} {"Oceanol. Acta"}
MACRO {oceanus} {"Oceanus"}
MACRO {paleoc} {"Paleoceanography"}
MACRO {pce} {"Phys. Chem. Earth"}
MACRO {pmg} {"Pap. Meteor. Geophys."}
MACRO {ppom} {"Pap. Phys. Oceanogr. Meteor."}
MACRO {physzeit} {"Phys. Z."}
MACRO {pps} {"Planet. Space Sci."}
MACRO {pss} {"Planet. Space Sci."}
MACRO {pag} {"Pure Appl. Geophys."}
MACRO {qjrms} {"Quart. J. Roy. Meteorol. Soc."}
MACRO {quatres} {"Quat. Res."}
MACRO {rsci} {"Radio Sci."}
MACRO {rse} {"Remote Sens. Environ."}
MACRO {rgeo} {"Rev. Geophys."}
MACRO {rgsp} {"Rev. Geophys. Space Phys."}
MACRO {rdgeo} {"Rev. Geofis."}
MACRO {revmeta} {"Rev. Meteorol."}
MACRO {sgp}{"Surveys in Geophys."}
MACRO {sp} {"Solar Phys."}
MACRO {ssr} {"Space Sci. Rev."}
MACRO {tellus} {"Tellus"}
MACRO {tac} {"Theor. Appl. Climatol."}
MACRO {tagu} {"Trans. Am. Geophys. Union (EOS)"}
MACRO {wrr} {"Water Resour. Res."}
MACRO {weather} {"Weather"}
MACRO {wafc} {"Weather Forecast."}
MACRO {ww} {"Weatherwise"}
MACRO {wmob} {"WMO Bull."}
MACRO {zeitmet} {"Z. Meteorol."}
 % End module: geojour.mbs
 %-------------------------------------------------------------------
 % Begin module:
 % \ProvidesFile{photjour.mbs}[1999/02/24 2.0b (PWD)]

MACRO {appopt} {"Appl. Opt."}
MACRO {bell} {"Bell Syst. Tech. J."}
MACRO {ell} {"Electron. Lett."}
MACRO {jasp} {"J. Appl. Spectr."}
MACRO {jqe} {"IEEE J. Quantum Electron."}
MACRO {jlwt} {"J. Lightwave Technol."}
MACRO {jmo} {"J. Mod. Opt."}
MACRO {josa} {"J. Opt. Soc. America"}
MACRO {josaa} {"J. Opt. Soc. Amer.~A"}
MACRO {josab} {"J. Opt. Soc. Amer.~B"}
MACRO {jdp} {"J. Phys. (Paris)"}
MACRO {oc} {"Opt. Commun."}
MACRO {ol} {"Opt. Lett."}
MACRO {phtl} {"IEEE Photon. Technol. Lett."}
MACRO {pspie} {"Proc. Soc. Photo-Opt. Instrum. Eng."}
MACRO {sse} {"Solid-State Electron."}
MACRO {sjot} {"Sov. J. Opt. Technol."}
MACRO {sjqe} {"Sov. J. Quantum Electron."}
MACRO {sleb} {"Sov. Phys.--Leb. Inst. Rep."}
MACRO {stph} {"Sov. Phys.--Techn. Phys."}
MACRO {stphl} {"Sov. Techn. Phys. Lett."}
MACRO {vr} {"Vision Res."}
MACRO {zph} {"Z. f. Physik"}
MACRO {zphb} {"Z. f. Physik~B"}
MACRO {zphd} {"Z. f. Physik~D"}

MACRO {CLEO} {"CLEO"}
MACRO {ASSL} {"Adv. Sol.-State Lasers"}
MACRO {OSA}  {"OSA"}
 % End module: photjour.mbs
%% Copyright 1994-2002 Patrick W Daly
MACRO {acmcs} {"ACM Comput. Surv."}

MACRO {acta} {"Acta Inf."}

MACRO {cacm} {"Commun. ACM"}

MACRO {ibmjrd} {"IBM J. Res. Dev."}

MACRO {ibmsj} {"IBM Syst.~J."}

MACRO {ieeese} {"IEEE Trans. Software Eng."}

MACRO {ieeetc} {"IEEE Trans. Comput."}

MACRO {ieeetcad}
 {"IEEE Trans. Comput. Aid. Des."}

MACRO {ipl} {"Inf. Process. Lett."}

MACRO {jacm} {"J.~ACM"}

MACRO {jcss} {"J.~Comput. Syst. Sci."}

MACRO {scp} {"Sci. Comput. Program."}

MACRO {sicomp} {"SIAM J. Comput."}

MACRO {tocs} {"ACM Trans. Comput. Syst."}

MACRO {tods} {"ACM Trans. Database Syst."}

MACRO {tog} {"ACM Trans. Graphic."}

MACRO {toms} {"ACM Trans. Math. Software"}

MACRO {toois} {"ACM Trans. Office Inf. Syst."}

MACRO {toplas} {"ACM Trans. Progr. Lang. Syst."}

MACRO {tcs} {"Theor. Comput. Sci."}

FUNCTION {bibinfo.check}
{ swap$
  duplicate$ missing$
    {
      pop$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ pop$
        }
        { swap$
          "\bibinfo{" swap$ * "}{" * swap$ * "}" *
        }
      if$
    }
  if$
}

FUNCTION {bibinfo.warn}
{ swap$
  duplicate$ missing$
    {
      swap$ "missing " swap$ * " in " * cite$ * warning$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ "empty " swap$ * " in " * cite$ * warning$
        }
        { swap$
          "\bibinfo{" swap$ * "}{" * swap$ * "}" *
        }
      if$
    }
  if$
}


FUNCTION {format.url}
{ url empty$
    { "" }
    { "\dourl{" url * "}" * }
  if$
}

FUNCTION {format.doi}
{ doi empty$
    { "" }
    { "\dodoi{" doi * "}" * }
  if$
}

STRINGS  { bibinfo}
INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 'bibinfo :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv~}{ll}{, jj}{, f.}"
      format.name$
      bibinfo bibinfo.check
      't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
               numnames #2 >
                { "" * }%% <<== was empty
                'skip$
              if$
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                {
                  " " * bbl.etal emphasize *
                }
                {", " * % <<== this line wasn't here
                  bbl.and
                  space.word * t *
                }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  } if$
}
FUNCTION {format.names.ed}
{
  'bibinfo :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{f.~}{vv~}{ll}{, jj}"
      format.name$
      bibinfo bibinfo.check
      't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              numnames #2 >
                { "," * }
                'skip$
              if$
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                {

                  " " * bbl.etal emphasize *
                }
                {
                  bbl.and
                  space.word * t *
                }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  } if$
}

FUNCTION {format.key}
{ empty$
    { key field.or.null }
    { "" }
  if$
}

FUNCTION {format.misckey}
{ empty$
    { key field.or.null }
    { ", " }
  if$
}




FUNCTION {format.authors}
{ author "author" format.names
}

FUNCTION {get.bbl.editor}
{ editor num.names$ #1 > 'bbl.editors 'bbl.editor if$ }

FUNCTION {format.editors}
{ editor "editor" format.names duplicate$ empty$ 'skip$
    {
      "," *
      " " *
      get.bbl.editor
      *
    }
  if$
}

FUNCTION {format.note}
{
 note empty$
    { "" }
    { note #1 #1 substring$
      duplicate$ "{" =
        'skip$
        { output.state mid.sentence =
          { "l" }
          { "u" }
        if$
        change.case$
        }
      if$
      note #2 global.max$ substring$ * "note" bibinfo.check
    }
  if$
}

FUNCTION {format.transnote}
{
 transnote empty$
    { "" }
    { transnote #1 #1 substring$
      duplicate$ "{" =
        'skip$
        { output.state mid.sentence =
          { "l" }
          { "u" }
        if$
        change.case$
        }
      if$
      transnote #2 global.max$ substring$ * "transnote" bibinfo.check
    ";" *}
  if$
}

FUNCTION {format.parentransnote}
{
 transnote empty$
    { "" }
    {"(" * transnote #1 #1 substring$
      duplicate$ "{" =
        'skip$
        { output.state mid.sentence =
          { "l" }
          { "u" }
        if$
        change.case$
        }
      if$
      transnote #2 global.max$ substring$ * "transnote" bibinfo.check
")" *    }
  if$
}


FUNCTION {format.noparentitle}
{ title
  duplicate$ empty$ 'skip$
    { "t" change.case$ }
  if$
  "title" bibinfo.check
  duplicate$ empty$ 'skip$
    {
      "\plainquote{" swap$ *
%% ++
%%      "}, " *
      "} " *
    }
  if$
}



FUNCTION {format.transtitle}
{ title
  duplicate$ empty$ 'skip$
    { "t" change.case$ }
  if$
  "title" bibinfo.check
  duplicate$ empty$ 'skip$
    {
      "\plainquote{" swap$ *
%% ++
      "} " *
    }
  if$
}

FUNCTION {end.quote.title}
{ title empty$
    'skip$
    { before.all 'output.state := }
  if$
}
FUNCTION {format.full.names}
{'s :=
 "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv~}{ll}" format.name$
      't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                {
                  " " * bbl.etal emphasize *
                }
                {
                  numnames #2 >
                    { "," * }
                    'skip$
                  if$
                  bbl.and
                  space.word * t *
                }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {author.editor.key.full}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key
          if$
        }
        { editor format.full.names }
      if$
    }
    { author format.full.names }
  if$
}

FUNCTION {author.key.full}
{ author empty$
    { key empty$
         { cite$ #1 #3 substring$ }
          'key
      if$
    }
    { author format.full.names }
  if$
}

FUNCTION {editor.key.full}
{ editor empty$
    { key empty$
         { cite$ #1 #3 substring$ }
          'key
      if$
    }
    { editor format.full.names }
  if$
}

FUNCTION {make.full.names}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.full
    { type$ "proceedings" =
        'editor.key.full
        'author.key.full
      if$
    }
  if$
}

FUNCTION {format.language}
{ language "language" format.names
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[{" write$
  label write$
  ")" make.full.names duplicate$ short.list =
     { pop$ }
     { * }
   if$
  "}]{" * write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {n.dashify}
{
  't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {word.in}
{ bbl.in
  " " * }

FUNCTION {reprintword.in}
{ bbl.reprintedin
  " " * }

FUNCTION {format.date}
{ year "year" bibinfo.check duplicate$ empty$
    {
    }
    'skip$
  if$
  bolden
  extra.label *
  before.all 'output.state :=
  " (" swap$ * ")" *
}

FUNCTION {format.description}
{ description "description" bibinfo.check duplicate$ empty$
    {
    }
    'skip$
  if$
  extra.label *
  before.all 'output.state :=
  " ``" swap$ * ",'' " *
}

FUNCTION {format.misc.date}
{ year "year" bibinfo.check duplicate$ empty$
    {
    }
    'skip$
  if$
  bolden
  extra.label *
  before.all 'output.state :=
  "" swap$ * 
}

FUNCTION {format.btitle}
{ title "title" bibinfo.check
  duplicate$ empty$ 'skip$
    {
      emphasize
    }
  if$
}
FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}
FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { bbl.volume volume vol.tie.or.space.prefix
bolden       "volume" bibinfo.check * *
      series "series" bibinfo.check
      duplicate$ empty$ 'pop$
        { swap$ bbl.of space.word * swap$
          emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.bvolume.inpro}
{ volume empty$
    { "" }
{xbbl.volume volume *
}
  if$
}


FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { series empty$
            { number "number" bibinfo.check }
        { output.state mid.sentence =
            { bbl.number }
            { bbl.number capitalize }
          if$
          number tie.or.space.prefix "number" bibinfo.check * *
          bbl.in space.word *
          series "series" bibinfo.check *
        }
      if$
    }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition duplicate$ empty$ 'skip$
    {
      output.state mid.sentence =
        { "l" }
        { "t" }
      if$ change.case$
      "edition" bibinfo.check
      " " * bbl.edition *
    }
  if$
}
INTEGERS { multiresult }
FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}
FUNCTION {format.pages}
{ pages duplicate$ empty$ 'skip$
    { duplicate$ multi.page.check
        {
          n.dashify
        }
        {
        }
      if$
      "pages" bibinfo.check
    }
  if$
}
FUNCTION {format.journal.pages}
{ pages duplicate$ empty$ 'pop$
    { swap$ duplicate$ empty$
        { pop$ pop$ format.pages }
        {
          ", " *
          swap$
          n.dashify
          "pages" bibinfo.check
          *
        }
      if$
    }
  if$
}
%% ++
FUNCTION {format.vol.num.pages}
{ volume field.or.null
bolden
  number empty$
    'skip$
    { "(" number * ")" * *
      volume empty$
        { }%
        'skip$
      if$
    }
  if$
format.journal.pages
    }


FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
        { bbl.chapter }
        { type "l" change.case$
          "type" bibinfo.check
        }
      if$
      chapter tie.or.space.prefix
      "chapter" bibinfo.check
      * *
      pages empty$
        'skip$
        { ", " * format.pages * }
      if$
    }
  if$
}



FUNCTION {format.booktitle}
{
  booktitle "booktitle" bibinfo.check
  emphasize
}

FUNCTION {format.in.ed.booktitle}
{ format.booktitle duplicate$ empty$ 'skip$
    {
      editor "editor" format.names.ed duplicate$ empty$ 'pop$
        {
          bbl.edby
          " " * swap$ *
          swap$
          "," *
          " " * swap$
          * }
      if$
     "in " swap$ *
    }
  if$
}

FUNCTION {format.thesis.type}
{ type duplicate$ empty$
    'pop$
    { swap$ pop$
      "t" change.case$ "type" bibinfo.check
    }
  if$
}

FUNCTION {format.title}
{ title
  duplicate$ empty$ 'skip$
    { "t" change.case$ }
  if$
  "title" bibinfo.check
  duplicate$ empty$ 'skip$
    {
      "\enquote{" swap$ *
      "} " *
    }
  if$
}

FUNCTION {format.tr.number}
{ number "number" bibinfo.check
  type duplicate$ empty$
    { pop$ bbl.techrep }
    'skip$
  if$
  "type" bibinfo.check
  swap$ duplicate$ empty$
    { pop$ "t" change.case$ }
    { tie.or.space.prefix * * }
  if$
}
FUNCTION {format.article.crossref}
{
  word.in
  " \cite{" * crossref * "}" *
}

%% +++ New and very difficult:
FUNCTION {format.book.pages}
{ pages duplicate$ empty$ 'skip$
    { duplicate$ multi.page.check
        {
          bbl.pages swap$
          n.dashify
        }
        {
          bbl.page swap$
        }
      if$
      tie.or.space.prefix
      "pages" bibinfo.check
      * *
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume duplicate$ empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      pop$ word.in
    }
    { bbl.volume
      swap$ tie.or.space.prefix "volume" bibinfo.check * * bbl.of space.word *
    }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{
  word.in
  " \cite{" * crossref * "}" *
}

FUNCTION {format.incollection.chapter.pages}
{ chapter empty$
    'format.book.pages
    { type empty$
        { bbl.chapter }
        { type "l" change.case$
          "type" bibinfo.check
        }
      if$
      chapter tie.or.space.prefix
      "chapter" bibinfo.check
      * *
      pages empty$
        'skip$
        {", " * format.book.pages *  
}
      if$
    }
  if$
}

FUNCTION {format.org.or.pub}
{ 't :=
  ""
  address empty$ t empty$ and
    'skip$
    {
      add.blank "(" *
      t empty$
        { address "address" bibinfo.check *
        }
        { t *
          address empty$
            'skip$
            { ", " * address "address" bibinfo.check * }
          if$
        }
      if$
      ")" *
    }
  if$
}

%%+=+
FUNCTION {format.in.org.or.pub}
{ 't :=
  ""
  address empty$ t empty$ and
    'skip$
    {
%% this line puts in too many commas
%      add.blank ", " *
      t empty$
        { address "address" bibinfo.check *
        }
        { t *
          address empty$
            'skip$
%% not this
            { ", " * address "address" bibinfo.check * }
          if$
        }
      if$
      "" *
    }
  if$
}

FUNCTION {format.inproceedings.publisher.address}
{ publisher "publisher" bibinfo.warn format.in.org.or.pub
}



%% ++
FUNCTION {format.noparens.org.or.pub}
{ 't :=
  " "
  address empty$ t empty$ and
    'skip$
    {
%% put comma in below
%      add.blank 
"" *
      t empty$
        { address "address" bibinfo.check *
        }
        { t *
          address empty$
            'skip$
%% keep comma below!
            { ", " * address "address" bibinfo.check * }
          if$
        }
      if$
      "" *
    }
  if$
}

FUNCTION {format.publisher.address}
{ publisher "publisher" bibinfo.warn format.org.or.pub
}

FUNCTION {format.proceedings.publisher.address}
{ publisher "publisher" bibinfo.warn format.org.or.pub
}

% same as above but called for
FUNCTION {format.bookpublisher.address}
{ publisher "publisher" bibinfo.warn format.org.or.pub
}

FUNCTION {format.inproceedings.address}
{ publisher "publisher" bibinfo.warn format.noparens.org.or.pub
}


FUNCTION {format.organization.address}
{ organization "organization" bibinfo.check format.org.or.pub
}


FUNCTION {format.inproceedings.organization.address}
{ organization "organization" bibinfo.check format.in.org.or.pub
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
%%
 year empty$
{}
{format.date "year" output.check}
if$
  date.block
  format.title "title" output.check
  end.quote.title
  crossref missing$
    {
journal empty$
{}
  {    journal
      "journal" bibinfo.check
      "journal" output.check
      add.blank}
if$
      format.vol.num.pages output
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  format.url output
  format.doi output
  format.note xoutput
  fin.entry
}

FUNCTION {xnewspaper}
{ output.bibitem
  format.authors "author" output.check
  format.title "title" output.check
  end.quote.title
  crossref missing$
   {
      publisher "," *
      "publisher" bibinfo.check
      "publisher" xoutput.check
   add.blank
%%      format.vol.num.pages output
%%
date empty$
{}
{"(" *
date "," *
"date" bibinfo.check
"date" xoutput.check
add.blank
}
if$
year empty$
{}
    {%newspaperformat.
format.date "year" output.check}
if$
    }
    {    }
  if$
  format.url xoutput
  format.doi xoutput
  format.note output
  fin.entry
}

FUNCTION {newspaper}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
%%
 year empty$
{}
{format.date "year" output.check}
if$
  date.block
  format.title "title" output.check
  end.quote.title
%%
  crossref missing$
    {
publisher empty$
{}
  {    publisher "" *
      "publisher" bibinfo.check
      "publisher" output.check
      add.blank}
if$
      format.vol.num.pages output
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
%%
date empty$
{}
{" (" * "\unskip" * date ")" *
"date" bibinfo.check
"date" xoutput.check
"\ignorespaces" *}
if$
  format.url output
  format.doi output
  format.note xoutput
  fin.entry
}

FUNCTION {translation}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
%%
 year empty$
{}
{format.date "year" output.check}
if$
  date.block
  format.transtitle "title" output.check
  end.quote.title
format.parentransnote output
%transnote empty$
%{}
%{"("  transnote "), " * *  } 
%if$
  crossref missing$
    {
journal empty$
{}
  {    journal
      "journal" bibinfo.check
      "journal" output.check
      add.blank}
if$
      format.vol.num.pages output
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  format.url output
  format.doi output
  format.note output
  fin.entry
}


FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
 year empty$
{}
{format.date "year" output.check
add.period$
}
if$
%
      format.number.series xoutput
 title empty$
{}
{format.btitle "title" xoutput.check}
if$
  crossref missing$
    { %% these three are not relevant
      format.bvolume output
%      format.number.series output
      format.edition output
%% new to avoid error message
publisher empty$
{}
{format.bookpublisher.address output}
if$
%% new command, ok so far
%      format.book.pages output
    }
    {
      format.book.crossref output.nonnull
    }
  if$
%% 
chapter empty$
{format.book.pages output}
{format.chapter.pages output}
if$
  format.url output
  format.note output
  fin.entry
}

%% new ++
FUNCTION {computercode}
{ output.bibitem
  language empty$
    { 
    }
    {"{\footnotesize\sc" * format.language output.nonnull
"}" *
%% good
year empty$
{}
  {format.date "year" output.check "." *}
if$
description empty$
{" " *}
{format.description "description" output.check}
if$
      crossref missing$
        { }
        'skip$
      if$
    }
  if$
"{\let\emph\relax" *
  format.btitle "title" xoutput.check
"}\eatspace" *
  crossref missing$
    { %% these three are not relevant
     format.bvolume output
    format.number.series output
    format.edition output
%% all new:
publisher empty$
{" " *}
{publisher "publisher"  output.check
"\eatspace" *
}
if$
address empty$
{" " *}
{address "address" output.check
}
if$
%
%% new command, ok so far
%      format.book.pages output
    }
    {
      format.book.crossref output.nonnull
    }
  if$
  format.url output
  format.doi output
  format.note output
  fin.entry
}


FUNCTION {booklet}
{ output.bibitem
  format.authors output
  author format.key output
  format.date "year" output.check
  date.block
  format.title "title" output.check
  end.quote.title
  howpublished "howpublished" bibinfo.check output
  address "address" bibinfo.check output
  format.url output
  format.doi output
  format.note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.date "year" output.check
  date.block
  format.btitle "title" output.check
  crossref missing$
    {
      format.bvolume output
      format.chapter.pages "chapter and pages" output.check
      format.number.series output
      format.edition output
      format.publisher.address output
    }
    {
      format.chapter.pages "chapter and pages" output.check
      format.book.crossref output.nonnull
    }
  if$
  format.url output
  format.doi output
  format.note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  date.block
  title empty$
{}
{  format.title "title" output.check
  end.quote.title}
if$
  crossref missing$
     { format.transnote output
format.in.ed.booktitle "booktitle" xoutput.check
      format.bvolume output
      format.number.series output
      format.edition output
%% next two line are new
publisher empty$
{}
  {   format.publisher.address output}
if$
     format.incollection.chapter.pages output
    }
    { format.incoll.inproc.crossref output.nonnull
% new
      format.incollection.chapter.pages xoutput
    }
  if$
  format.url output
  format.doi output
  format.note output
  fin.entry
}


FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
%% new
  format.date "year" output.check "." *
  format.title "title" xoutput.check
  end.quote.title
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.number.series output
        publisher empty$
%% change from this to next line
%%        { format.organization.address output }
    {format.inproceedings.organization.address output}
        { organization "organization" bibinfo.check output
          format.inproceedings.publisher.address output
        }
      if$
%% not here
%      format.date "year" output.check
%% new
      format.bvolume.inpro output
      format.book.pages output
    }
    { format.incoll.inproc.crossref output.nonnull
%% new
      format.book.pages output
    }
  if$
  format.url output
  format.doi output
  format.note output
  fin.entry
}


FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  format.authors output
  author format.key output
  format.date "year" output.check
  date.block
  format.btitle "title" output.check
  organization "organization" bibinfo.check output
  address "address" bibinfo.check output
  format.edition output
  format.url output
  format.doi output
  format.note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  date.block
  format.title
  "title" output.check
  end.quote.title
  bbl.mthesis format.thesis.type output.nonnull
  school "school" bibinfo.warn output
  address "address" bibinfo.check output
  format.url output
  format.doi output
  format.note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
key empty$
{}
{format.misckey output}
if$
year empty$
{}
  {" (" * format.misc.date "year" output.check ")" *}
if$
  date.block
  format.noparentitle output
  end.quote.title
  howpublished "howpublished" bibinfo.check output
  format.url output
  format.doi output
  format.note output
  fin.entry
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  date.block
  format.title
  "title" output.check
  end.quote.title
  bbl.phdthesis format.thesis.type output.nonnull
  school "school" bibinfo.warn output
  address "address" bibinfo.check output
  format.url output
  format.doi output
  format.note output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  format.editors output
  editor format.key output
  format.date "year" output.check
  date.block
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  publisher empty$
    { format.organization.address output }
    { organization "organization" bibinfo.check output
      format.publisher.address output
    }
  if$
  format.url output
  format.doi output
  format.note output
  fin.entry
}


FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
year empty$
{}
  {format.date "year" output.check "." *}
if$
  date.block
title empty$
{}
{  format.title
  "title" output.check
  end.quote.title}
if$
  format.tr.number output.nonnull
% institution "institution" bibinfo.warn output
%  address "address" bibinfo.check output
%% all new:
%publisher empty$
%{" " *}
%{publisher "publisher"  output.check
%"\eatspace" *
%}
%if$
%address empty$
%{" " *}
%{address "address" output.check
%}
%if$
%%%
publisher empty$
{"" *}
{format.publisher.address output}
if$
  format.url output
  format.doi output
  format.note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  date.block
  format.title "title" output.check
  end.quote.title
  format.url output
  format.doi output
  format.note "note" output.check
  fin.entry
}

FUNCTION {default.type} { misc }
READ
FUNCTION {sortify}
{ purify$
  "l" change.case$
}
INTEGERS { len }
FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}
FUNCTION {format.lab.names}
{ 's :=
  "" 't :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #2 >
    { pop$
      " " * bbl.etal emphasize *
    }
    { #2 <
        'skip$
        { s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            {
              " " * bbl.etal emphasize *
            }
            { bbl.and space.word * s #2 "{vv~}{ll}" format.name$
              * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key
          if$
        }
        { editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.label}
{ editor empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
        'editor.key.label
        'author.key.label
      if$
    }
  if$
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list
  "("
  *
  year duplicate$ empty$
  short.list key field.or.null = or
     { pop$ "" }
     'skip$
  if$
  *
  'label :=
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv{ } }{ll{ }}{  f{ }}{  jj{ }}"
      format.name$ 't :=
      nameptr #1 >
        {
          "   "  *
          namesleft #1 = t "others" = and
            { "zzzzz" * }
            { t sortify * }
          if$
        }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}
FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}
FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}
FUNCTION {editor.sort}
{ editor empty$
    { key empty$
        { "to sort, need editor or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { editor sort.format.names }
  if$
}
FUNCTION {presort}
{ calc.label
  label sortify
  "    "
  *
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
        'editor.sort
        'author.sort
      if$
    }
  if$
  #1 entry.max$ substring$
  'sort.label :=
  sort.label
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}
SORT
STRINGS { last.label next.extra }
INTEGERS { last.extra.num number.label }
FUNCTION {initialize.extra.label.stuff}
{ #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'last.extra.num :=
  #0 'number.label :=
}
FUNCTION {forward.pass}
{ last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
  number.label #1 + 'number.label :=
}
FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label 'next.extra :=
  extra.label
  duplicate$ empty$
    'skip$
    { "{\natexlab{" swap$ * "}}" * }
  if$
  'extra.label :=
  label extra.label * 'label :=
}
EXECUTE {initialize.extra.label.stuff}
ITERATE {forward.pass}
REVERSE {reverse.pass}
FUNCTION {bib.sort.order}
{ sort.label
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}
ITERATE {bib.sort.order}
SORT
FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{" number.label int.to.str$ * "}" *
  write$ newline$
  "\def\enquote#1{``#1,''}"
  write$ newline$
  "\def\plainquote#1{``#1''}"
  write$ newline$
  "\expandafter\ifx\csname natexlab\endcsname\relax\def\natexlab#1{#1}\fi"
  write$ newline$
  "\providecommand{\dourl}[1]{\href{http://#1}{\nolinkurl{#1}}}"
  write$ newline$
  "\providecommand{\bibinfo}[2]{#2}"
  write$ newline$
  "\providecommand{\noopsort}[1]{}"
  write$ newline$
  "\providecommand{\switchargs}[2]{#2#1}"
  write$ newline$
  "  \def\eatspace #1{#1}"
%%
  write$ newline$
}
EXECUTE {begin.bib}
EXECUTE {init.state.consts}
ITERATE {call.type$}
FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}
EXECUTE {end.bib}
%% End of customized bst file
%%
%% End of file `jasaauthyear.bst'.
