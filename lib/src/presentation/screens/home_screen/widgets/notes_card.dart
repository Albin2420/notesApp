import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/src/data/models/notes/note_model.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;
  final Color color;

  final VoidCallback onTap;

  const NoteCard({
    super.key,
    required this.note,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.08),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              note.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            if (note.description.isNotEmpty) const SizedBox(height: 10),

            Text(
              note.description,
              style: GoogleFonts.inter(
                fontSize: 15,
                color: Colors.black87.withOpacity(.85),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
