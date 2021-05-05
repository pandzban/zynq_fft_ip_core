//
// Vivado(TM)
// rundef.js: a Vivado-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "E:/Vivado_2018_3/SDK/2018.3/bin;E:/Vivado_2018_3/Vivado/2018.3/ids_lite/ISE/bin/nt64;E:/Vivado_2018_3/Vivado/2018.3/ids_lite/ISE/lib/nt64;E:/Vivado_2018_3/Vivado/2018.3/bin;";
} else {
  PathVal = "E:/Vivado_2018_3/SDK/2018.3/bin;E:/Vivado_2018_3/Vivado/2018.3/ids_lite/ISE/bin/nt64;E:/Vivado_2018_3/Vivado/2018.3/ids_lite/ISE/lib/nt64;E:/Vivado_2018_3/Vivado/2018.3/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


ISEStep( "vivado",
         "-log Phase_Re_Factor_ROM_Memory.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source Phase_Re_Factor_ROM_Memory.tcl" );



function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}