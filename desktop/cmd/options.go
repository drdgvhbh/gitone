package main

import (
	"github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/plugins/file_picker"
)

var options = []flutter.Option{
	flutter.WindowInitialDimensions(600, 600),
	flutter.WindowDimensionLimits(600, 600, 10000, 10000),
	flutter.AddPlugin(&file_picker.FilePickerPlugin{
	}),
	//flutter.AddPlugin(&path_provider.PathProviderPlugin{
	//	VendorName:      "myOrganizationOrUsername",
	//	ApplicationName: "myApplicationName",
	//}),
}
 