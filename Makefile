VERSION_FILE=version.txt
OUTPUT_DIR=$(HOME)/.kmpXcframeworks
ZIP_FILE=$(OUTPUT_DIR)/Shared.xcframework.zip

.PHONY: create_local_kmp

create_local_kmp:
		@mkdir -p $(OUTPUT_DIR)
		@echo "Reading version from $(VERSION_FILE)..."
		@VERSION=$$(cat $(VERSION_FILE)); \
		echo "Building XCFramework for version $$VERSION..."
		@./gradlew :shared:assembleSharedXCFramework
		@echo "Zipping XCFramework..."
		@zip -r $(ZIP_FILE) shared/build/XCFrameworks/release/Shared.xcframework
		@echo "XCFramework saved to $(ZIP_FILE)"
