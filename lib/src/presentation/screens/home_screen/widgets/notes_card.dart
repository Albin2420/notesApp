import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
    final formattedDate = DateFormat('MMMM d').format(note.createdAt);

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
            const SizedBox(height: 8),

            if (note.title.trim().isNotEmpty)
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

            if (note.title.trim().isNotEmpty &&
                note.description.trim().isNotEmpty)
              const SizedBox(height: 10),

            if (note.description.trim().isNotEmpty)
              Text(
                note.description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Colors.white.withOpacity(.85),
                  height: 1.5,
                ),
              ),

            SizedBox(height: 10),
            Text(
              formattedDate,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
