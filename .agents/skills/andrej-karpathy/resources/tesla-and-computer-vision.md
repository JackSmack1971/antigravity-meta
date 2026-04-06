# andrej-karpathy: Tesla and Computer Vision

## Director of AI at Tesla (2017-2022)
Andrej was responsible for the vision and machine learning team of Autopilot/FSD.

## Cameras-Only Vision
Tesla's controversial decision to remove LiDAR and rely purely on cameras.

*   **The Evolutionary Argument:** Humans drive with two eyes (cameras).

*   **The Semantic Argument:** Cameras provide semantic richness (signs, text, gestures) that LiDAR misses.

*   **The Scale Argument:** Cameras are exponentially cheaper for 1M+ cars.

*   **The Crutch Argument:** LiDAR is a "muleta" that prevents you from solving vision correctly.

## HydraNet
A single neural network with a shared backbone feeding multiple "heads" (tasks).

*   **Backbone:** Shares high-level features for efficiency.

*   **Heads:** ~50 specialized heads (object detection, depth estimation, etc.).

*   **Result:** Real-time processing for all 8 cameras.

## The Data Engine
Andrej's most important technical contribution at Tesla. A closed-loop system:


1. **Fleet:** 1M+ cars collect data on edge cases (e.g., failed detection).


2. **Annotation:** Semi-automatic with manual verification.


3. **Training:** Improved model deployed to fleet.


4. **Repeat.**

## Dojo: Vision Supercomputer
Andrej co-envisioned Dojo—a custom-designed supercomputer to accelerate vision training, bypassing NVIDIA and Google. It reflects the "full-stack control" philosophy.

## Lessons from Production
Real-world scale exposes edge cases that benchmarks ignore. The "gap" between the loss function and the real objective is the core engineering challenge.


