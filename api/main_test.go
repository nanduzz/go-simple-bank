package api

import (
	"github.com/gin-gonic/gin"
	db "github.com/nanduzz/simplebank/db/sqlc"
	"github.com/nanduzz/simplebank/util"
	"github.com/stretchr/testify/require"
	"os"
	"testing"
	"time"
)

func newTestServer(t *testing.T, store db.Store) *Server {
	config := util.Config{
		TokenSymmetricKey:   util.RandomString(32),
		AccessTokenDuration: time.Minute,
	}

	server, err := NewServer(config, store)
	require.NoError(t, err)

	return server
}

func TestMain(m *testing.M) {
	gin.SetMode(gin.TestMode)
	// call flag.Parse() here if TestMain uses flags
	os.Exit(m.Run())
}
