@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
ECHO.This version of Ruby has not been built with support for Windows 95/98/Me.
GOTO :EOF
:WinNT

set RUBY_COMPAT_VERSION=2.2.0
set RUBY_ARCH=i386-mingw32

set RUBYLIB=%~dp0..\lib\ruby\site_ruby\%RUBY_COMPAT_VERSION%
set RUBYLIB=%RUBYLIB%;%~dp0..\lib\ruby\site_ruby\%RUBY_COMPAT_VERSION%\%RUBY_ARCH%
set RUBYLIB=%RUBYLIB%;%~dp0..\lib\ruby\site_ruby
set RUBYLIB=%RUBYLIB%;%~dp0..\lib\ruby\vendor_ruby\%RUBY_COMPAT_VERSION%
set RUBYLIB=%RUBYLIB%;%~dp0..\lib\ruby\vendor_ruby\%RUBY_COMPAT_VERSION%\%RUBY_ARCH%
set RUBYLIB=%RUBYLIB%;%~dp0..\lib\ruby\vendor_ruby
set RUBYLIB=%RUBYLIB%;%~dp0..\lib\ruby\%RUBY_COMPAT_VERSION%
set RUBYLIB=%RUBYLIB%;%~dp0..\lib\ruby\%RUBY_COMPAT_VERSION%\%RUBY_ARCH%
set RUBY_COMPAT_VERSION=
set RUBY_ARCH=

set SSL_CERT_DIR=
set SSL_CERT_FILE=%~dp0..\lib\ca-bundle.crt
@"%~dp0..\bin.real\ruby.exe" "%~dp0..\bin.real\gem" %*
