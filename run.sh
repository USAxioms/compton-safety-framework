#!/bin/bash

################################################################################
# R3 COLLATERAL SYSTEM - WAD-18 REPRODUCIBILITY CAPSULE v1.0.0
# CodeOcean run.sh script
################################################################################

echo "================================================================================"
echo "R3 COLLATERAL SYSTEM - WAD-18 REPRODUCIBILITY CAPSULE v1.0.0"
echo "CodeOcean Environment"
echo "================================================================================"
echo ""

# Go to /code
cd /code

echo "STEP 1: Setting up environment..."
echo "✓ Node.js $(node -v) found"
echo "Working directory: /code"
echo ""

# ============================================================================
# STEP 2: Install npm dependencies
# ============================================================================
echo "STEP 2: Installing npm dependencies..."
npm install --silent
echo "✓ Dependencies installed"
echo ""

# ============================================================================
# STEP 3: Build TypeScript
# ============================================================================
echo "STEP 3: Building TypeScript..."
npm run build

if [ $? -ne 0 ]; then
    echo "✗ Build failed!"
    exit 1
fi

echo "✓ Build successful"
echo ""

# ============================================================================
# STEP 4: Run integration example
# ============================================================================
echo "STEP 4: Running integration example..."
echo ""

npm run integration

if [ $? -ne 0 ]; then
    echo ""
    echo "✗ Integration failed!"
    exit 1
fi

echo ""
echo "================================================================================"
echo "✓ R3 Collateral WAD-18 Capsule completed successfully!"
echo "================================================================================"
