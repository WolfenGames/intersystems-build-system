Class Example.Builder
{

/// <p>Build</p>
/// <p><table style='width:100%'><tr><th>Who</th><th>When</th><th>Ref.</th><th>Change</th></tr>
/// <tr><td>Julian</td><td>2024/06/11</td><td>AOF</td><td>Initial</td></tr>
/// </table></p>
ClassMethod Build(BuildPath As %String = "")
{
	set ExportFiles("Example.*.CLS")=""

	try {
		set ExampleVersion="0.1.1"
		set FileName = ##Class(%File).NormalizeFilename(BuildPath_"/EXAMPLE_"_ExampleVersion_".xml")
		$$$ThrowOnError($System.OBJ.Export(.ExportFiles,FileName))
	} catch ex {
		Write "Failed to export: "_ex.DisplayString(), !
	}
}

}
