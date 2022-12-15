// Copyright © 2020 Łukasz Kurowski. All rights reserved.
// SPDX-License-Identifier: MIT

// Script used to generate test data.
package main

import (
	"encoding/base32"
	"fmt"
	"math"
	"strings"

	varint "github.com/multiformats/go-varint"
)

var b32 = base32.StdEncoding.WithPadding(base32.NoPadding)

func printCase(i uint64) {
	data := varint.ToUvarint(i)
	str := strings.ToLower(b32.EncodeToString(data))
	fmt.Printf("  ; %dL, %q\n", i, str)
}

func main() {
	for i := uint64(0); i < 1024; i += 64 {
		printCase(i)
	}
	for i := uint64(10); i > 0; i-- {
		printCase(math.MaxUint64 / i)
	}
}
