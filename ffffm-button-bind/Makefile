include $(TOPDIR)/rules.mk

PKG_NAME:=ffffm-button-bind
PKG_VERSION:=2
PKG_RELEASE:=1

include $(TOPDIR)/../package/gluon.mk

define Package/$(PKG_NAME)
  MAINTAINER:=Freifunk Frankfurt and Kiel
  TITLE:=Bind a router button to a feature set
  DEPENDS:=+gluon-web-admin
endef

$(eval $(call BuildPackageGluon,$(PKG_NAME)))
