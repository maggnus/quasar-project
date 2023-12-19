package main

import (
	"fmt"
	echo "github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"html/template"
	"io"
	"net"
	"net/http"
	"strings"
)

// TemplateRenderer is a custom renderer for HTML templates
type TemplateRenderer struct {
	templates *template.Template
}

// Render renders an HTML template
func (t *TemplateRenderer) Render(w io.Writer, name string, data interface{}, c echo.Context) error {
	return t.templates.ExecuteTemplate(w, name, data)
}

func main() {
	var e = echo.New()
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	// Load HTML templates
	renderer := &TemplateRenderer{
		templates: template.Must(template.ParseGlob("templates/*.html")),
	}
	e.Renderer = renderer

	e.GET("/", func(c echo.Context) error {

		localIPsString, err := GetLocalIPv4String()
		if err != nil {
			e.Logger.Error(err)
		}

		data := map[string]interface{}{
			"Text": localIPsString,
		}

		return c.Render(http.StatusOK, "index.html", data)
	})

	e.GET("/process", process)

	e.GET("/fatal", func(c echo.Context) error {
		e.Logger.Fatal("buy!")
		return nil
	})

	e.Logger.Fatal(e.Start(":9000"))

}

func process(c echo.Context) error {
	sum := 0
	for i := 0; i < 100000000; i++ {
		sum += 1
	}
	return c.JSON(http.StatusCreated, sum)
}

// GetLocalIPv4String returns a string containing all IPv4 addresses joined together.
func GetLocalIPv4String() (string, error) {
	// Initialize a slice to store non-loopback IPv4 addresses
	var ipv4Addresses []string

	// Get a list of network interfaces
	interfaces, err := net.Interfaces()
	if err != nil {
		return "", fmt.Errorf("error getting interfaces: %v", err)
	}

	// Iterate over each interface
	for _, iface := range interfaces {
		// Get the addresses associated with the interface
		addrs, err := iface.Addrs()
		if err != nil {
			return "", fmt.Errorf("error getting addresses for interface %s: %v", iface.Name, err)
		}

		// Extract non-loopback IPv4 addresses from the addresses list
		for _, addr := range addrs {
			if ipnet, ok := addr.(*net.IPNet); ok && ipnet.IP.To4() != nil && !ipnet.IP.IsLoopback() {
				ipv4Addresses = append(ipv4Addresses, ipnet.IP.String())
			}
		}
	}

	// Join non-loopback IPv4 addresses into a comma-separated string
	result := strings.Join(ipv4Addresses, ", ")
	return result, nil
}
