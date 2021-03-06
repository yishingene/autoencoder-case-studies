# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

install_ruta <- function() {
  devtools::install_github("fdavidcl/ruta", ref = "dev")
}

allow_growth <- function() {
  gpu_options <- tensorflow::tf$GPUOptions(allow_growth = TRUE)
  config <- tensorflow::tf$ConfigProto(gpu_options = gpu_options)
  keras::k_set_session(tensorflow::tf$Session(config = config))
}

.onLoad <- function(libname, pkgname) {
  message("
Welcome to the supplementary experiments for the paper 'A Showcase
of the Use of Autoencoders in Feature Learning Applications'
------------------------------------------------------------------

Inside this package, you will find 4 main functions:
  anomaly_detection()
    Creates a synthetic multi-valued time series with an anomalous
    region and performs anomaly detection.
  visualization()
    Downloads the Statlog dataset and compacts it to 2 and 3
    dimensions for visualization.
  hashing()
    Loads IMDB dataset from Keras, trains an autoencoder and
    hashes the test subset, measuring the correspondance between
    distance among instances and Hamming distance among their
    hashes.
  denoising()
    Loads CIFAR10 dataset and trains a denoising autoencoder,
    performs denoising over the test subset.

")
}
