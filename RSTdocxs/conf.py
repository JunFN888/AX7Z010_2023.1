# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'ZYNQ 7000开发平台FPGA教程'
copyright = '2024, JunFN'
author = 'JunFN'
release = '1.0'


html_theme_options = {
    "logo_only": True,
}

html_logo = "7Z010_S1_RSTdocument/images/00_media/8.png"
html_logo_format = "png"


import os
import sys
sys.path.insert(0, os.path.abspath('../..'))
# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = []

templates_path = ['_templates']
exclude_patterns = []

language = 'zh_CN'

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_book_theme'
#html_theme = 'sphinx_rtd_theme'
