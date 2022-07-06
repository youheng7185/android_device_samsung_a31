LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LIBGLES_MEOW_LIBRARY := /vendor/lib/egl/libGLES_meow.so

LIBGLES_MEOW_SYMLINK := $(TARGET_OUT_VENDOR)/lib/libGLES_meow.so
$(LIBGLES_MEOW_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/libGLES_meow.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(LIBGLES_MEOW_LIBRARY) $@

ALL_DEFAULT_INSTALLED_MODULES += \
	$(LIBGLES_MEOW_SYMLINK)
