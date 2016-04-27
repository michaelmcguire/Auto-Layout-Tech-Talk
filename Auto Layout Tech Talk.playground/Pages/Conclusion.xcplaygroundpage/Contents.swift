/*:
 [Previous](@previous)
 # Conclusions

 * You can use manual layout and/or Auto Layout to position your subviews
 * For views participating in Auto Layout, make sure to set `translatesAutoresizingMaskIntoConstraints` to `false`
 * Be aware of the order of layout
    * The measurement phase (`updateConstraints`) goes from the bottom-up
    * Trait Collection updates (`traitCollectionDidChange:`) go from the top-down
    * The layout phase (`layoutSubviews`) goes from the top-down
 * NEVER call `layoutSubviews`
    * Call `setNeedsLayout`
 * NEVER call `updateConstraints`
    * Call `setNeedsUpdateConstraints`
 * You can modify or react to the output of Auto Layout in `layoutSubviews`, but make sure to `setNeedsLayout` when you do.

 */