package api

import (
	"github.com/gin-gonic/gin"
	"os"
	"testing"
)

func TestMain(m *testing.M) {
	gin.SetMode(gin.TestMode)
	// call flag.Parse() here if TestMain uses flags
	os.Exit(m.Run())
}
