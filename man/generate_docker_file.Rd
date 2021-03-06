% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/environment.R
\name{generate_docker_file}
\alias{generate_docker_file}
\title{Generate a dockerfile string to build the image for training.}
\usage{
generate_docker_file(custom_docker_image = NULL, cran_packages = NULL,
  github_packages = NULL, custom_url_packages = NULL,
  install_system_packages = TRUE)
}
\arguments{
\item{custom_docker_image}{The name of the docker image from which the image
to use for training will be built. If not set, a default CPU based image will
be used as the base image.}

\item{cran_packages}{list of `cran_package` objects to be installed.}

\item{github_packages}{character vector of github packages to be installed.}

\item{custom_url_packages}{character vector of packages to be installed from
local, directory or custom url.}

\item{install_system_packages}{logical parameter to specify if system
packages should be installed at runtime.}
}
\value{
Dockerfile string
}
\description{
Generate a dockerfile string to build the image for training.
}
