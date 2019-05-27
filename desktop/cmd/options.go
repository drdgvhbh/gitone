package main

import (
	"github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/plugins/file_picker"
)

var options = []flutter.Option{
	flutter.WindowInitialDimensions(800, 1280),
	flutter.AddPlugin(&file_picker.FilePickerPlugin{
	}),
	//flutter.AddPlugin(&path_provider.PathProviderPlugin{
	//	VendorName:      "myOrganizationOrUsername",
	//	ApplicationName: "myApplicationName",
	//}),
}
 