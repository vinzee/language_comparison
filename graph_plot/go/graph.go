package main

import (
"fmt"
"image/color"
"github.com/gonum/plot/plotter"
"math/rand"
"testing"
"github.com/gonum/plot"
)

func PlotData(){
    rand.Seed(100)
    num := 100
    data := make(plotter.XYs, num)
    for i := 0; i < num; i++ {
        data[i].X = float64(i)
        data[i].Y = float64(rand.Intn(100))
    }
    myplot, err := plot.New()
    if err != nil {
        fmt.Println("Error while creating a plotter")
    }
    myplot.Title.Text = "Sample Plot"
    h, err := plotter.NewHistogram(data, num)
    if err != nil {
        fmt.Println("Error while creating a plot")
    }
    h.FillColor = color.RGBA{R: 255, A: 255}

    myplot.Add(h)

    err = myplot.Save(600, 500, "plot.jpeg")
    if err != nil {
        fmt.Println(err)
    }
}

func BenchmarkPlotData(b *testing.B) {
    for i := 0; i < b.N; i++ {
         PlotData()
    }
}

func main() {
    br := testing.Benchmark(BenchmarkPlotData)
    fmt.Println("time for json graph plot program in Go is ", br.NsPerOp(), " nanosecons")
    fmt.Println("memory for graph plot program in Go is ", br.AllocedBytesPerOp(), " bytes")
}
