
# helper functions to highlight and reveal hidden text on tap

glowToggle <- function(label, hidden_text) {
  sprintf(
    '<span class="glow toggle">
       %s
       <span class="italic hidden-text">%s</span>
     </span>',
    label, hidden_text
  )
}

glowTogglePre <- function(label, hidden_text) {
  sprintf(
    '<span class="glow-pre toggle">%s<span class="italic hidden-text">%s</span></span>',
    label, hidden_text
  )
}
