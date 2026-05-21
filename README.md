🚁 Real-Time Short-Horizon Predictive Navigation for UAVs

This repository contains the implementation of a real-time path planning framework for UAVs operating in highly dynamic 3D environments with moving obstacles.

The proposed method is based on a short-horizon predictive decision-making strategy combined with a candidate-based local optimization mechanism, enabling safe and stable navigation under strict real-time constraints.

📌 Key Features
🧭 Frame-by-frame local motion decision (no global trajectory dependency)
🔮 Short-horizon prediction of dynamic obstacles
⚙️ Multi-criteria fitness-based candidate selection
🚧 Realistic UAV kinematic and safety constraints
🧠 Hierarchical multi-step predictive planning
⚡ Designed for real-time execution with bounded latency
🔧 FPGA acceleration support for computationally intensive modules
🌍 Simulation Environment

The system is tested in a 3D bounded environment containing:

Moving cylindrical obstacles with random motion patterns
Dynamic velocity changes (acceleration, swapping behavior)
Sensor noise injection
Wind disturbance model
Boundary collision handling

The UAV operates under:

Maximum speed constraint: 10 m/s
Heading/pitch limits per frame
One-second decision update cycle
🧠 Core Idea

At each time step:

Generate candidate motion points within a 10m reachable radius
Filter invalid points using safety and motion constraints
Evaluate valid points using a fitness function
Select the optimal point for the next frame

To improve robustness, a hierarchical predictive mechanism expands the decision process over multiple future steps using predicted obstacle motion.

⚙️ Hardware Acceleration

To ensure real-time performance under high computational load:

Collision checking
Candidate evaluation
Obstacle prediction

are implemented in FPGA-based hardware acceleration, providing deterministic execution time and bounded latency.

📊 Evaluation Metrics
Success rate (%)
Minimum distance to obstacles
Path length
Time to goal
Computational cost per frame
Prediction Success Index (PSI)
📈 Results Summary

The proposed method demonstrates:

High success rate in dense dynamic environments
Stable navigation under uncertainty
Lower collision probability compared to greedy, APF, and DWA baselines
Real-time feasibility with hardware acceleration
🧩 Baseline Methods
Greedy local planner
Artificial Potential Field (APF)
Dynamic Window Approach (DWA)
ORCA
